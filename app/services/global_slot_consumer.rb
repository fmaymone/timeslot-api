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
    raw_result = fetch('locations', muid)
    convert_mall_location(raw_result)
  end

  def search(category, query)
    uri = URI.parse(ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_URL'])
    uri.path += category
    uri.query = URI.encode_www_form(query)

    user = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_NAME']
    pw = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    raise DataTeamServiceError.new('ELASTIC_SEARCH', e)
  else
    result = Oj.load(raw_result)
    crawler_slots = result['search-slots']
    slots = []
    crawler_slots.each { |slot| slots << ElasticSearchSlot.new(slot) }
    slots
  end

  private def fetch(resource_type, muid)
    uri = URI.parse(ENV['TS_DATA_MALL_URL'])
    uri.path += "#{resource_type}/#{muid}"
    user = ENV['TS_DATA_MALL_USERNAME']
    pw = ENV['TS_DATA_MALL_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    raise DataTeamServiceError.new('DATA_MALL', e)
  else
    # I could also pass open(uri, auth) directly to Oj.load, it would then call
    # 'read' on it itself
    result = Oj.load(raw_result)[resource_type]
    fail ActiveRecord::RecordNotFound if result.empty?
    result.first
  end

  private def convert_mall_location(result)
    {
      luid: result['muid'],
      name: result['title'],
      # thoroughfare: result['street'],
      # sub_thoroughfare: result[''],
      locality: result['city'],
      # sub_locality: result[''],
      administrative_area: result['region'],
      # sub_administrative_area: result[''],
      postal_code: result['postcode'],
      country: result['country'],
      # iso_country_code: result[''],
      # in_land_water: result[''],
      # ocean: result[''],
      # areas_of_interest: result[''],
      latitude: result['latitude'],
      longitude: result['longitude']
    }
  end

  private def convert_mall_slot(result)
    {
      meta: {
        title: result['title'],
        start_date: result['start_timestamp'],
        end_date: result['stop_timestamp'],
        location_uid: result['location_muid']
      },
      user: User.find_by(role: 2, username: result['domain']),

      # crawler is sending 'none' for 'muid'...
      muid: (result['muid'].nil? || result['muid'] == 'None') ? (result['duid'] || result['cuid']) : result['muid'],
      url: result['url'],
      # tags: result['tags'], # currently unused
      media: [
        {
          public_id: result['images'],
          position: 1,
          media_type: "image"
        }
      ],
      notes: [
        {
          title: 'Description',
          content: result['description']
        }
      ]
    }
  end
end
