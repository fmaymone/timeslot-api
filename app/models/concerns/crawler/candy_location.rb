class CandyLocation
  attr_reader :uuid,
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

  ### CandyShop Location Attributes ###
  # title
  # street_address text - strasse & hausnummer
  # locality text - city
  # neighborhood text - viertel, zb. friedrichshain
  # admin_area text - bundesland
  # sub_admin_area text - landkreis
  # postcode text
  # country_iso_code text
  # latitude double precision
  # longitude double precision

  ## currently unused information
  # phone text
  # fax text
  # email text
  # opening_hours text
  # urls
  # domains
  # description
  # tags
  # images
  # address_raw text - from the website that was crawled
  # time_zone text
  # last_geocoding_request timestamp with time zone
  # duid
  # muid
  # uuid

  def initialize(params)
    @uuid = params['muid']
    @name = params['title']
    @thoroughfare = params['street_address']
    # @sub_thoroughfare = params['']
    @locality = params['locality']
    @sub_locality = params['neighborhood']
    @administrative_area = params['admin_area']
    @sub_administrative_area = params['sub_admin_area']
    @postal_code = params['postcode']
    # @country = params['country']
    @iso_country_code = params['country_iso_code']
    # @in_land_water = params['']
    # @ocean = params['']
    # @areas_of_interest = params['']
    @latitude = params['latitude']
    @longitude = params['longitude']
  end
end
