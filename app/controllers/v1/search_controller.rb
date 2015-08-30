class V1::SearchController < ApplicationController

  def index
    authorize :search
    # default route to "v1/search/"
    # here we can add multi search
    head 422
  end

  # TODO: define and check allowed attributes for searching
  def user
    authorize :search
    @users = Search.new(User, params[:attr] || :username,
                              query, page)
    render "v1/users/index"
  end

  def email
    authorize :search
    @users = Search.new(User, params[:attr] || :email,
                              query, page)
    render "v1/users/index"
  end

  def media
    authorize :search
    @media_items = Search.new(MediaItem, params[:attr] || :title,
                                         query, page)
    render "v1/media/index"
  end

  def slot
    authorize :search
    @slots = Search.new(MetaSlot, params[:attr] || :title,
                                  query, page)
    #render json: @slots
    render "v1/slots/index"
  end

  def group
    authorize :search
    @groups = Search.new(Group, params[:attr] || :name,
                                query, page)
    render "v1/groups/index"
  end

  def location
    authorize :search
    @locations = Search.new(IosLocation, params[:attr] || :name,
                                         query, page)
    render "v1/locations/index"
  end

  private def query
    # if we need to store usernames/titles with specials signs then we have to
    # save username/title transliterated as well to get better search results
    # http://apidock.com/rails/ActiveSupport/Inflector/transliterate
    ActiveSupport::Inflector
        .transliterate(params.require(:query))
        .gsub(/[^a-zA-Z0-9\s@-_.]/, "")
  end

  private def page
    params.permit(:page, :limit).symbolize_keys
  end

  # TODO: extend search with filter and scope
  # private def filter
  #   params.permit(:include, :exclude).symbolize_keys
  # end
  #
  # private def scope
  #   params.require(:scope).permit(:private, :public, :friend, :group)
  #                         .symbolize_keys if params[:scope].present?
  # end
end
