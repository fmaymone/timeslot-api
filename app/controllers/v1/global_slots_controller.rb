module V1
  require 'open-uri'

  class GlobalSlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # GET /v1/globalslots/search?q=Trash&timestamp=2015-07-05&size=20
    def search
      # TODO: data team should remove redundant 'search_'
      uri = URI.parse("http://search.timeslot.rocks:56000/api/search_")
      # uri = URI.parse(ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_URL'])
      uri.path += category_param
      uri.query = URI.encode_www_form(search_params)

      user = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_NAME']
      pw = ENV['TS_GLOBALSLOTS_SEARCH_SERVICE_PASSWORD']
      auth = { http_basic_authentication: [user, pw] }

      begin
        # Never pass unchecked URI to 'open'
        # http://sakurity.com/blog/2015/02/28/openuri.html
        raw_result = open(uri, auth).read
      rescue => e
        Airbrake.notify(e)
        return render json: { error: "GlobalSlot Search Service Error: #{e}" },
                      status: :service_unavailable
      end

      result = Oj.load(raw_result)
      crawler_slots = result['search-slots']
      slots = []
      crawler_slots.each { |slot| slots << CrawlerSlot.new(slot) }

      render :index, locals: { slots: slots }
    end

    private def category_param
      valid_categories = %w(cinema football)
      category = params.require(:category)

      unless valid_categories.include? category
        fail ParameterInvalid, "category must be one of #{valid_categories}"
      end
      category
    end

    private def search_params
      params.require(:q)
      es_search_params = params.permit(:q)

      # TODO: make helper for this or put in application_controller
      if params[:moment].present?
        moment = params[:moment]
        begin
          # not every invalid date fails, it might also just return nil
          valid_date = Time.zone.parse(moment)
        rescue
          valid_date = nil
        end
        fail ParameterInvalid.new(:moment, moment) unless valid_date
      end
      es_search_params[:timestamp] = valid_date.as_json || Time.zone.now.as_json

      limit = params[:limit]
      size = limit.to_i > 100 ? 100 : limit.to_i if params[:limit].present?
      es_search_params[:size] = size || 20
      es_search_params
    end
  end
end
