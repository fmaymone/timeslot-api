# maps the elastic search result to the backend slot attributes
class ElasticSearchSlot
  attr_reader :sources
  attr_accessor :muid,
                :start_date,
                :end_date,
                :title,
                :loc_name,
                :locality,
                :thoroughfare,
                :country,
                :latitude,
                :longitude,
                :image,
                :description,
                :tags,
                :url

  def initialize(crawler_slot)
    @muid = crawler_slot['muid']
    @title = crawler_slot['title']
    @start_date = crawler_slot['start_timestamptz'] || crawler_slot['start_timestamp']
    @end_date = crawler_slot['stop_timestamptz'] || crawler_slot['stop_timestamp']

    # @address_raw = crawler_slot['address_raw']
    @loc_name = crawler_slot['location']
    # @loc_name = crawler_slot['location_title']
    # @locality = crawler_slot['locality'] # should be included in 'location' but this is not always the case...
    # @country = crawler_slot['country']
    @iso_country_code = crawler_slot['country_iso_code']
    @longitude, @latitude = crawler_slot['location_geo']

    @url = crawler_slot['url']
    # @tags = crawler_slot['tags']
    @image = crawler_slot['images']
    @description = crawler_slot['description']
    @sources = [source(crawler_slot['domain'])]
  end

  private def source(domain)
    case domain
    when 'dfb.de'
      { name: 'DFB', url: 'http://dfb.de', image: 'https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png' }
    when 'moviepilot.de'
      { name: 'Moviepilot', url: 'http://moviepilot.de', image: 'http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg' }
    else
      user = User.find_by(role: 2, username: domain)
      { name: user.username, url: user.public_url, image: user.picture }
    end
  end
end
