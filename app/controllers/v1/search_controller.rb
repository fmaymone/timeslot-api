module V1
  class SearchController < ApplicationController
    # GET /v1/search/categories
    def categories
      authorize :search
      categories = GlobalSlotConsumer.new.categories

      render json: { categories: categories }
    end

    # GET /v1/search/user
    def user
      authorize :search
      return head 422 unless has_allowed_params?
      @users = Search.new(User, params[:attr] || 'username', query, page)

      render "v1/users/list"
    end

    # GET /v1/search/friend
    def friend
      authorize :search
      return head 422 unless has_allowed_params?
      friends = current_user.friends_by_request_ids +
                current_user.friends_by_offer_ids

      if friends.any?
        @users = Search.new(
          User.where(id: friends), params[:attr] || 'username', query, page)
      else
        @users = []
      end

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

    # GET /v1/search/calendars
    def calendars
      authorize :search
      result = ClawMachine.new.search(category: 'calendars',
                                      query_params: query_and_limit)

      render body: result, content_type: "application/json"
    end

    # GET /v1/search/location
    def location
      authorize :search
      return head 422 unless has_allowed_params?
      @locations = Search.new(IosLocation, params[:attr] || 'name', query, page)

      render "v1/locations/index"
    end

    private def query_and_limit
      es_search_params = { q: "" }
      es_search_params[:q] = params[:q]

      if params[:limit].present?
        limit = params[:limit]
        es_search_params[:limit] = limit.to_i > 100 ? 100 : limit.to_i
      end
      es_search_params
    end

    private def query
      # if we need to store usernames/titles with specials signs then we have to
      # search through username/title transliterated as well to get better search results
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
      params.permit(:page,
                    :limit,
                    :method,
                    :include,
                    :exclude).symbolize_keys
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
