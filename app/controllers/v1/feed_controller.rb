module V1
  class FeedController < ApplicationController

    # GET /v1/feed/user
    # The user feed stores all activities for a user.
    # Think of it as your personal Facebook page.
    def user_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      render json: Feed.user_feed(current_user.id, page_params),
             status: :ok
    end

    # GET /v1/feed/news
    # News feeds store activities from the people you follow.
    # There is both a flat newsfeed (similar to twitter)
    # and an aggregated newsfeed (like facebook).
    def news_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      style = params[:style].presence || 'aggregated'
      render json: Feed.news_feed(current_user.id, page_params, style),
             status: :ok
    end

    # GET /v1/feed/notification
    # This feed can be used to build notification functionality.
    def notification_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      render json: Feed.notification_feed(current_user.id, page_params),
             status: :ok
    end

    private def page_params
      params.permit(:limit, :offset, :cursor).symbolize_keys
    end

    private def has_allowed_params?
      params[:style].nil? || params[:style].in?(%w(flat aggregated))
    end
  end
end
