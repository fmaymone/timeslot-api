module V1
  require 'open-uri'

  class SearchController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET /v1/search/?q=berghain&limit=20&pos=13.0,52.0&date=05.05.2015
    # Global search through elastic search (crawler)
    def index
      authorize :search

      search_url = ENV['TS_SEARCH_SERVICE_URL']
      user = ENV['TS_SEARCH_SERVICE_NAME']
      pw = ENV['TS_SEARCH_SERVICE_PASSWORD']
      auth = { http_basic_authentication: [user, pw] }

      query = search_url + "?q=" + params.require(:query) +
                           "&size=" + (page[:limit] || 10) +
                           "&date=" + (page[:datetime] || Time.now)
      begin
        result = open(query, auth).read
      rescue => e
        Airbrake.notify(e)
        return render json: { error: "Search Service Error: #{e}" },
                      status: :service_unavailable
      end
      render json: result, status: :ok
    end

    # GET /v1/search/user
    # TODO: define and check allowed attributes for searching
    def user
      authorize :search
      @users = Search.new(User, params[:attr] || 'username',
                                query, page)
      render "v1/users/index"
    end

    # GET /v1/search/email
    def email
      authorize :search
      @users = Search.new(User, params[:attr] || 'email',
                                query, page)
      render "v1/users/index"
    end

    # GET /v1/search/media
    def media
      authorize :search
      @media_items = Search.new(MediaItem, params[:attr] || 'title',
                                           query, page)
      render "v1/media/index"
    end

    # GET /v1/search/slot
    def slot
      authorize :search
      @slots = Search.new(MetaSlot, params[:attr] || 'title',
                                    query, page)
      #render json: @slots
      render "v1/slots/index"
    end

    # GET /v1/search/group
    def group
      authorize :search
      @groups = Search.new(Group, params[:attr] || 'name',
                                  query, page)
      render "v1/groups/index"
    end

    # GET /v1/search/location
    def location
      authorize :search
      @locations = Search.new(IosLocation, params[:attr] || 'name',
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
      params.permit(:datetime, :page, :limit, :method).symbolize_keys
    end

    # Example rails sanitize:
    # ActiveRecord::Base.sanitize(query)

    # Extend search with filter and scope:
    #
    # private def filter
    #   params.permit(:include, :exclude).symbolize_keys
    # end
    #
    # private def scope
    #   params.require(:scope).permit(:private, :public, :friend, :group)
    #                         .symbolize_keys if params[:scope].present?
    # end
  end
end
