class Feed
  @@enricher = StreamRails::Enrich.new
  mattr_reader :enricher

  def self.user_feed(user_id, params)
    feed = StreamRails.feed_manager.get_user_feed(user_id)
    page = paginate(feed, params)
    enricher.enrich_activities(page)
  end

  def self.news_feed(user_id, params, style = 'aggregated')
    feed = StreamRails.feed_manager.get_news_feeds(user_id)
    page = paginate(feed[style.to_sym], params)
    case style
      when :flat
        enricher.enrich_activities(page)
      else#:aggregated
        enricher.enrich_aggregated_activities(page)
    end
  end

  def self.notification_feed(user_id, params)
    feed = StreamRails.feed_manager.get_notification_feed(user_id)
    page = paginate(feed, params)
    enricher.enrich_activities(page)
  end

  # Cursor based pagination is a lot faster and supported as well.
  # To go with cursor based pagination we have to implement exchanging
  # of page hashes (as cursors) between backend and frontend.
  def self.paginate(feed, limit: 20, offset: 0, cursor: nil)
    (cursor ? feed.get(limit: limit.to_i,
                       id_lt: cursor,
                       mark_seen: true)
            : feed.get(limit: limit.to_i,
                       offset: offset,
                       mark_seen: true)
    )['results']
  end
end
