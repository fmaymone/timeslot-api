require 'open-uri'

class ClawMachine
  # forwards search queries to the 'Claw Machine' (ElasticSearch Service)
  include TSErrors

  def search(category:, query_params:)
    uri = URI.parse(ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_URL'])

    uri.path += category
    uri.query = URI.encode_www_form(query_params)

    user = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_NAME']
    pw = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => error
    raise DataTeamServiceError.new('CLAW_MACHINE', error)
  else
    raw_result
  end
end
