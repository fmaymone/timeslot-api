# maps the elastic search result to the backend slot attributes
class ElasticSearchSlot
  attr_reader :creator
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
    @muid = crawler_slot['muid'] || crawler_slot['duid'] || crawler_slot['cuid']
    @title = crawler_slot['title']
    @start_date = crawler_slot['start_timestamp']
    @end_date = crawler_slot['stop_timestamp']

    @location = crawler_slot['location']
    @address = crawler_slot['address']
    @loc_name = crawler_slot['address'].split(',').first
    @locality = crawler_slot['city']
    @country = crawler_slot['country']
    @longitude, @latitude = crawler_slot['location_geo']

    @url = crawler_slot['url']
    # @tags = crawler_slot['tags']
    @image = crawler_slot['images']
    @description = crawler_slot['description']
    @creator = source(crawler_slot['domain'])
  end

  private def source(domain)
    User.find_by(role: 2, username: domain)
  end
end
