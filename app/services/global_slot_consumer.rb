require 'open-uri'

# this guy interacts with the data team
class GlobalSlotConsumer
  include TSErrors

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
end
