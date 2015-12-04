module V1
  require 'open-uri'

  class SearchController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET /v1/search/?q=berghain&limit=10&timestamp=2015-08-08T12:00
    # Global search through elastic search (crawler data)
    def index
      authorize :search

      user = ENV['TS_SEARCH_SERVICE_NAME']
      pw = ENV['TS_SEARCH_SERVICE_PASSWORD']
      auth = { http_basic_authentication: [user, pw] }

      search_url = ENV['TS_SEARCH_SERVICE_URL']
      time = page[:datetime] || Time.zone.now.strftime('%Y-%m-%dT%H:%M')

      query = "#{search_url}?q=#{params.require(:query)}" \
              "&size=#{page[:limit] || 10}&timestamp=#{time}"

      begin
        result = open(URI.escape(query), auth).read
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
      return head 422 unless has_allowed_params?
      @users = Search.new(User, params[:attr] || 'username', query, page)

      render "v1/users/list"
    end

    # GET /v1/search/email
    def email
      authorize :search
      return head 422 unless has_allowed_params?
      @users = Search.new(User, params[:attr] || 'email', query, page)

      render "v1/users/list"
    end

    # GET /v1/search/media
    def media
      authorize :search
      return head 422 unless has_allowed_params?
      @media_items = Search.new(MediaItem, params[:attr] || 'title', query, page)

      render "v1/media/index"
    end

    # GET /v1/search/slot
    def slot
      authorize :search
      return head 422 unless has_allowed_params?
      @slots = Search.new(MetaSlot, params[:attr] || 'title', query, page)

      render "v1/slots/index"
    end

    # GET /v1/search/group
    def group
      authorize :search
      return head 422 unless has_allowed_params?
      @groups = Search.new(Group, params[:attr] || 'name', query, page)

      render "v1/groups/index"
    end

    # GET /v1/search/location
    def location
      authorize :search
      return head 422 unless has_allowed_params?
      @locations = Search.new(IosLocation, params[:attr] || 'name', query, page)

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

    private def has_allowed_params?
      if params[:attr].present?
        return false unless params[:attr].in?(%w(username name title email))
      end
      if params[:method].present?
        return false unless params[:method].in?(%w(equal like soundex difference metaphone levenshtein))
      end
      true
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
