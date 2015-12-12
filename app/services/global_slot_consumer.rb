require 'open-uri'

class GlobalSlotConsumer
  # this guy interacts with the data team

  # gets a global slot from the TS_DATA_MALL based on a muid
  def fetch(uuid)
    uri = URI.parse("http://37.187.174.91:50100/api/v0/slots/")
    # uri = URI.parse(ENV['TS_DATA_MALL_URL'])
    uri.path += uuid

    user = ENV['TS_DATA_MALL_USERNAME']
    pw = ENV['TS_DATA_MALL_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    raise e
  else
    convert_mall_to_backend(raw_result)
  end

  def search(category, query)
    # TODO: data team should remove redundant 'search_'
    # uri = URI.parse("http://search.timeslot.rocks:56000/api/search_")
    uri = URI.parse("http://es.timeslot.rocks:56000/api/search_")
    # uri = URI.parse(ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_URL'])
    uri.path += category
    uri.query = URI.encode_www_form(query)

    user = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_NAME']
    pw = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    raise e
  else
    result = Oj.load(raw_result)
    crawler_slots = result['search-slots']
    slots = []
    crawler_slots.each { |slot| slots << ElasticSearchSlot.new(slot) }
    slots
  end

  private def convert_mall_to_backend(raw_result)
    result = Oj.load(raw_result)['slots'].first
    {
      meta: {
        title: result['title'],
        start_date: result['start_timestamp'],
        end_date: result['stop_timestamp'],
        creator: User.find_by(role: 2, username: result['domain'])
      },

      # location: result['location'],
      # loc_name: result['address'].split(',').first
      # locality: result['city'],
      # country: result['country'],
      # latitude: result['latitude'],
      # longitude: result['longitude']

      image: result['images'],
      cuid: result['cuid'],
      duid: result['duid'],
      url: result['url'],
      tags: result['tags'],
      description: result['description'],
      crawler_id: result['id']
    }
  end
end
