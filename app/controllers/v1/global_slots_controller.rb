module V1
  class GlobalSlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :search
    skip_after_action :verify_authorized, only: :search

    # GET /v1/globalslots/search?q=Trash&timestamp=2015-07-05&size=20
    def search
      slots = GlobalSlotConsumer.new.search(category_param, search_params)
    rescue ParameterInvalid => e
      # TODO: refactor this. need that shit so I can return a 422,
      # otherwise the next rescue block is used.
      raise e
    rescue => e
      Airbrake.notify(e)
      return render json: { error: "GlobalSlot Search Service Error: #{e}" },
                    status: :service_unavailable
    else
      render :index, locals: { slots: slots }
    end

    # POST /v1/globalslots/reslot
    def create_reslot
      authorize GlobalSlot.new

      # check if slot already exists in local db
      muid = params.require(:predecessor)
      global_slot = GlobalSlot.find_by(muid: muid)

      global_slot ||= begin
                        # if no: fetch global slot from megastore by cuid
                        globalslot_attributes = GlobalSlotConsumer.new.fetch(muid)

                      rescue => e
                        Airbrake.notify(e)
                        return render json: { error: "DATA MALL Fetch Error: #{e}" },
                                      status: :service_unavailable
                      else
                        # create metaslot and globalslot
                        GlobalSlot.create_slot(globalslot_attributes)
                      end
      # create reslot for current user
      reslot = ReSlot.create_from_slot(predecessor: global_slot,
                                       slotter: current_user)
                                       # visibility: params[:visibility])

      if reslot.save
        render "v1/slots/create", status: :created, locals: { slot: reslot }
      else
        render json: { error: reslot.errors }, status: :unprocessable_entity
      end
    end

    private def category_param
      # this could also be an ENV var
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
