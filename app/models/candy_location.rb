class CandyLocation
  attr_reader :name,
              :luid,
              :name,
              :thoroughfare,
              :sub_thoroughfare,
              :locality,
              :sub_locality,
              :administrative_area,
              :sub_administrative_area,
              :postal_code,
              :country,
              :iso_country_code,
              :in_land_water,
              :ocean,
              :areas_of_interest,
              :latitude,
              :longitude

  def initialize(params)
    @name = params['title']
    # @thoroughfare = params['street']
    # @sub_thoroughfare = params['']
    @locality = params['city']
    # @sub_locality = params['']
    @administrative_area = params['region']
    # @sub_administrative_area = params['']
    @postal_code = params['postcode']
    @country = params['country']
    # @iso_country_code = params['']
    # @in_land_water = params['']
    # @ocean = params['']
    # @areas_of_interest = params['']
    @latitude = params['latitude']
    @longitude = params['longitude']
  end
end
