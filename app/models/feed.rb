module Feed
  def self.user_feed(user_id, params = {})
    feed = $redis.smembers("Feed:#{user_id}:User")
    page = paginate(feed, params)
    enrich_feed(page, 'me')
  end

  def self.notification_feed(user_id, params = {})
    feed = $redis.smembers("Feed:#{user_id}:Notification")
    page = paginate(feed, params)
    enrich_feed(page, 'notify')
  end

  def self.news_feed(user_id, params = {})
    feed = collect_feed(user_id)
    page = aggregate_feed(feed, user_id, params)
    enrich_feed(page, 'activity')
  end

  def self.remove_target_from_feed(target)
    $redis.srem("Feed:#{target}:#{target}")
  end

  def self.collect_feed(user_id)
    feed = []
    # TODO: for now we send activities to all users
    # In "real" situation the feed dispatcher collect the related feed
    # through social relations (called: followings), these are also mapped in redis
    # To test the intended logic, we use this temporary switch here
    # This is only for current simulation of a "public activity feed"
    # When the iOS has implemented friends and groups, we can remove this switch
    if Rails.env.test?
      # Test of feed dispatcher through social relations
      $redis.smembers("Follow:User:#{user_id}:following").each do |target|
        target = JSON.parse(target)
        feed.concat($redis.smembers("Feed:#{target[0]}:#{target[1]}") || [])
      end
    else
      # Temporary fallback to simulate a "public activity" feed
      # The limit for the to field is 100
      slot_ids = StdSlotPublic.all.collect(&:id)
      slot_ids.uniq.each do |slot|
        feed.concat($redis.smembers("Feed:StdSlotPublic:#{slot}") || [])
      end
      slot_ids = ReSlot.all.collect(&:id)
      slot_ids.uniq.each do |slot|
        feed.concat($redis.smembers("Feed:ReSlot:#{slot}") || [])
      end
      # Remove the user who did the actual comment
      #slot_ids.delete(activity_target.id)
    end
    feed
  end

  def self.paginate(feed, limit: 25, offset: 0, cursor: nil)
    # Get offset in reversed logic (LIFO), supports simple cursor fallback
    offset = cursor ? cursor.to_i : offset.to_i
    # Catch MIN as MAX in reversed order
    min = [offset + limit.to_i - 1, feed.count].min
    # paginate through offset and limit
    feed[offset..min].reverse!.map do |a|
      enrich_activity(JSON.parse(ActiveSupport::Gzip.decompress(a)))
    end
  end

  def self.enrich_activity(activity)
    {
      type: activity[0],
      actor: activity[1],
      object: activity[2],
      target: activity[3],
      activity: activity[4],
      foreignId: activity[5],
      time: activity[6],
      id: activity[7]
    }.as_json
  end

  def self.enrich_feed(feed, view)
    feed.each do |activity|
      # Set single actors to array to simplify enrichment process
      activity['actors'] ||= [activity['actor']] if activity['actor']
      # In handy we remove the single field 'actor' on aggregated feeds
      activity.delete('actor')
      # Determine pluralization
      count = activity['actors'].count
      mode = count > 2 ? 'aggregate' : (count > 1 ? 'plural' : 'singular')
      # Determine translation key
      key = "#{activity['type'].downcase}_#{activity['activity']}_#{view}_#{mode}"
      # Determine translation params
      # Get the first actor
      actor = JSON.parse(ActiveSupport::Gzip.decompress(
        $redis.get("Actor:#{activity['actors'].first}")
      ))
      # Adds the first username and sets usercount as translation params
      i18_params = {
        USER: actor['username'],
        USERCOUNT: count
      }
      # Get target
      target = JSON.parse(ActiveSupport::Gzip.decompress(
        $redis.get("Target:#{activity['type']}:#{activity['target']}")
      ))
      # Enrich with custom activity data (shared objects)
      activity['data'] = {
          target: target,
          actor: actor
      }
      # Add the title to the translation params holder
      i18_params[:TITLE] = target['title'] if target['title']
      # Collect further usernames for aggregated messages (actual we need 2 at maximum)
      if count > 1
        # Get further actor (second)
        actor = JSON.parse(ActiveSupport::Gzip.decompress(
          $redis.get("Actor:#{activity['actors'].second}")
        ))
        # Add the second username to the translation params holder
        i18_params[:USER2] = actor['username']
      end
      # Update message params with enriched message
      activity['message'] = I18n.t(key, i18_params)
    end
    feed
  end

  # TODO: We can optimize this by aggregating feeds when storing into redis
  # NOTE: If we use "live aggregation" we are able to modify
  # the aggregation logic on the fly
  def self.aggregate_feed(feed, user_id, limit: 25, offset: 0, cursor: nil)
    # Get offset from cursor in reversed logic (LIFO), supports simple offset fallback
    offset = cursor ? cursor.to_i : offset.to_i
    # Temporary holder to store the aggregation feed
    aggregated_feed = []
    # The aggregation group index table
    groups = {}
    # The index of the group index table
    index = -1
    # To determine the paging cursor we use a counter
    # Also we use this counter to check on break condition if limit is reached
    count = 0
    # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
    # Loop through all feeds (has a break statement, offset is optional)
    feed[0..(feed.count - offset)].reverse!.each do |post|
      # Parse JSON from string
      post = enrich_activity(JSON.parse(ActiveSupport::Gzip.decompress(post)))
      # Prepare dictionary shortcuts
      actor = post['actor'].to_i
      # Skip own activities
      next if (actor == user_id) || (post['foreignId'] && (post['actor'] == post['foreignId']))
      # Generates group tag (aggregation index)
      group = post['group'] = "#{post['target']}#{post['activity']}" ##{post['time']}
      # If group exist on this page then aggregate to this group
      if groups.has_key?(group)
        # Determine current aggregation group index
        current = groups[group]
        # Get current aggregation group feed
        current_feed = aggregated_feed[current]
        # Update activity count
        current_feed['activityCount'] += 1
        # Collect actors as unique
        current_feed['actors'] << actor unless current_feed['actors'].include?(actor)
      # If group does not exist, creates a new group for aggregations
      elsif count < limit.to_i
        # Increment index on each new group (starting from -1)
        current = groups[group] = (index += 1)
        # Set the whole activity object on each new group
        # which takes the last state of all activities
        current_feed = aggregated_feed[current] = post
        # We create a new array-field 'actors' on each
        # new group and add current actor to it
        current_feed['actors'] = [actor]
        # Init activity counter
        current_feed['activityCount'] = 1
        # Sets a generated feed id to prevent id conflicts with other activity views
        current_feed['id'] = Digest::SHA1.hexdigest(group).upcase
      else
        # Breaks the aggregation process if limit is reached
        break
      end
      # Set or update current feed next cursor (if the limit isn't reached)
      current_feed['cursor'] = ((count += 1) + offset).to_s
    end
    aggregated_feed
  end
end
