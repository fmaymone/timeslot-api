module V1
  class GlobalSlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :search
    skip_after_action :verify_authorized, only: :search

    # GET /v1/globalslots/search?q=Trash&timestamp=2015-07-05&size=20
    def search
      slots = GlobalSlotConsumer.new.search(category_param, search_params)
      render :index, locals: { slots: slots }
    end

    # POST /v1/globalslots/reslot
    def create_reslot
      authorize GlobalSlot.new

      muid = params.require(:predecessor)
      global_slot = GlobalSlot.find_or_create(muid)
      reslot = ReSlot.create_from_slot(predecessor: global_slot,
                                       slotter: current_user,
                                       visibility: visibility)
      if reslot.save
        render "v1/slots/create", status: :created, locals: { slot: reslot }
      else
        render json: { error: reslot.errors }, status: :unprocessable_entity
      end
    end

    private def category_param
      category = params.require(:category)
      valid_categories = %w(cinema football) # this could also be an ENV var
      return category if valid_categories.include? category

      fail ParameterInvalid.new(:category, category)
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

      if params[:limit].present?
        limit = params[:limit]
        es_search_params[:limit] = limit.to_i > 100 ? 100 : limit.to_i
      else
        es_search_params[:limit] = 20
      end
      es_search_params
    end
  end
end
