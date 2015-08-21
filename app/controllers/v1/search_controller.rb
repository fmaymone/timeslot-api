class V1::SearchController < ApplicationController
  def index
    # default route to "v1/search/"
    # here we can add multi search
    head :error
  end

  def users
    authorize :search

    if(search = search_params)
      render json: User.where('username LIKE ? OR email LIKE ?', search, search)
    else
      render json: {}
    end
  end

  def slots
    authorize :search

    if(search = search_params)
      render json: MetaSlot.where('title LIKE ?', search)
    else
      render json: {}
    end
  end

  def media
    authorize :search

    if(search = search_params)
      render json: MediaItem.where('title LIKE ?', search)
    else
      render json: {}
    end
  end

  private def search_params
    return false if params.require(:query).length < 3
    #params.require(:include, :exclude) unless params[:filter].present?
    #params.permit(:private, :public, :group) unless params[:scope].present?
    #params.permit(:query, :filter, :scope).symbolize_keys
    "%" << params[:query] << "%"
  end
end
