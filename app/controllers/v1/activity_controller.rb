#require 'sse'
module V1
  class ActivityController < ApplicationController

    # GET /v1/users/1/feed
    # The user feed stores all activities for a user.
    # Think of it as your personal Facebook page.
    def user_feed
      authorize :activity
      return head 422 unless has_allowed_params?
      feed = StreamRails.feed_manager.get_user_feed(current_user.id)
      render json: paginate(feed), status: :ok
    end

    # GET /v1/users/1/news
    # News feeds store activities from the people you follow.
    # There is both a flat newsfeed (similar to twitter)
    # and an aggregated newsfeed (like facebook).
    def news_feed
      authorize :activity
      return head 422 unless has_allowed_params?
      feed = StreamRails.feed_manager.get_news_feeds(current_user.id)
      render json: paginate(feed[params[:style].to_sym]), status: :ok
    end

    # GET /v1/users/1/notification
    # The notification feed can be used to build notification functionality.
    def notification_feed
      authorize :activity
      return head 422 unless has_allowed_params?
      feed = StreamRails.feed_manager.get_notification_feed(current_user.id)
      render json: paginate(feed), status: :ok
    end

    private def paginate(result)
      # Simple pagination via offset and limit
      results = result.get(
          limit: params[:limit].presence || 20,
          offset: params[:offset].presence || 0
      )['results']

      # This feature enriches the activity view
      StreamRails::Enrich.new.enrich_activities(results)
    end

    # Cursor based pagination is a lot faster and supported as well.
    # To go with cursor based pagination we have to implement exchanging
    # of page hashes (as cursors) between backend and frontend.
    # private def cursor(result)
    #   result[params[:style]].get(limit: params[:limit] || 20,
    #              id_lt: params[:cursor] || 0)['results']
    # end

    private def has_allowed_params?
      params.permit(:limit, :offset, :cursor, :style)
      # Set 'aggregated' view as default
      (params[:style] ||= 'aggregated').in?(%w(flat aggregated))
    end
  end
end
