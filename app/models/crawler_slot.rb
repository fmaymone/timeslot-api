class CrawlerSlot
  attr_reader :creator
  attr_accessor :start_date,
                :end_date,
                :title,
                :loc_name,
                :locality,
                :thoroughfare,
                :country,
                :latitude,
                :longitude,
                :crawler_id,
                :description,
                :tags,
                :url,
                :cuid,
                :duid,
                :images

  ## Crawler Slot Parameter ##
  #               :id,
  #               :title,
  #               :start_timestamp,
  #               :stop_timestamp,
  #               :domain,
  #               :location,
  #               :address,
  #               :city,
  #               :country,
  #               :location_geo,
  #               :cuid,
  #               :duid,
  #               :url,
  #               :tags,
  #               :images,
  #               :description,
  #               :duration_secs

  def initialize(crawler_slot)
    @title = crawler_slot['title']
    @start_date = crawler_slot['start_timestamp']
    @end_date = crawler_slot['stop_timestamp']
    @crawler_id = crawler_slot['id']
    @domain = crawler_slot['domain']
    @location = crawler_slot['location']
    @address = crawler_slot['address']
    @loc_name = crawler_slot['address'].split(',').first
    @locality = crawler_slot['city']
    @country = crawler_slot['country']
    @longitude, @latitude = crawler_slot['location_geo']
    @cuid = crawler_slot['cuid']
    @duid = crawler_slot['duid']
    @url = crawler_slot['url']
    @tags = crawler_slot['tags']
    @image = crawler_slot['images']
    @description = crawler_slot['description']
    @creator = source
  end

  private def source
    User.find_by(role: 2, username: @domain)
  end
end
