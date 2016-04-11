require 'open-uri'

# this guy interacts with the data team
class GlobalSlotConsumer
  include TSErrors

  # gets a global slot from the TS_DATA_MALL based on a muid
  def slot(muid)
    raw_result = fetch('slots', muid)
    convert_mall_slot(raw_result)
  end

  # gets a global slot location from TS_DATA_MALL, based on muid
  def location(muid)
    raw_result = {}
    timespent_location_fetch = Benchmark.measure {
      raw_result = fetch('locations', muid)
    }
    Rails.logger.warn {
      "Fetching location for slot #{muid} has taken #{timespent_location_fetch}"
    }
    CandyLocation.new(raw_result)
  end

  # fetch a global slot category from TS_DATA_MALL
  # and create a user with role 'global_slot_category'
  def category(uuid)
    raw_result = fetch('categories', uuid)
    User.create(user_uuid: uuid,
                username: raw_result['name'],
                picture: raw_result['image'],
                role: 'global_slot_category',
                email: "#{raw_result['name'].downcase}.category@timeslot.com"
               )
  end

  def prepare_search(category = nil, query = nil)
    uri = URI.parse(ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_URL'])
    if category && query
      uri.path += category
      uri.query = URI.encode_www_form(query)
    end

    user = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_NAME']
    pw = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    raise DataTeamServiceError.new('ELASTIC_SEARCH', e)
  else
    Oj.load(raw_result)
  end

  # TODO: rename to 'slots'
  def search(category, query)
    result = prepare_search(category, query)
    crawler_slots = result['result']['slots']
    slots = []
    crawler_slots.each { |slot| slots << ElasticSearchSlot.new(slot) }
    slots
  end

  def categories
    result = prepare_search
    result['_links'].keys
  end

  private def fetch(resource_type, muid)
    uri = URI.parse(ENV['TS_DATA_MALL_URL'])
    uri.path += "#{resource_type}/#{muid}"

    user = ENV['TS_DATA_MALL_NAME']
    pw = ENV['TS_DATA_MALL_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    if e.class == OpenURI::HTTPError && e.io.status.first == '404'
      raise ActiveRecord::RecordNotFound
    else
      raise DataTeamServiceError.new('DATA_MALL', e)
    end
  else
    # I could also pass open(uri, auth) directly to Oj.load, it would then call
    # 'read' on it itself
    result = Oj.load(raw_result)[resource_type]
    result.first
  end

  private def convert_mall_slot(result)
    slot_data = {
      category_uuid: result['category_uuid'],
      meta: {
        title: result['title'],
        start_date: result['start_timestamptz'],
        end_date: result['stop_timestamptz'],
        location_uid: result['location_muid']
      },
      muid: result['muid'],
      url: result['urls'].try(:first),
      # tags: result['tags'], # currently unused
      # domains: result['domains'], # currently unused
      media: [
        {
          public_id: result['images'].try(:first),
          position: 1,
          media_type: "image"
        }
      ]
    }
    if result['description']
      slot_data[:notes] = [
        {
          title: 'Description',
          content: result['description']
        }
      ]
    end
    slot_data
  end
end
