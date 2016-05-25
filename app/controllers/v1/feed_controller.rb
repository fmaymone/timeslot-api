module V1
  class FeedController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :discovery_feed

    # Set users locale for translations
    before_action :set_locale

    # GET /v1/discover
    # GET /v1/feed/discovery
    def discovery_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      feed = Feed.discovery_feed(page_params)
      render_feed(feed)
    end

    # GET /v1/feed/user
    # The user feed stores all activities for a user.
    # Think of it as your personal Facebook page.
    def user_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      feed = Feed.user_feed(current_user.id, page_params)
      render_feed(feed)
    end

    # GET /v1/feed/news
    # News feeds store activities from the people you follow.
    # There is both a flat newsfeed (similar to twitter)
    # and an aggregated newsfeed (like facebook).
    def news_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      feed = Feed.news_feed(current_user.id, page_params)
      render_feed(feed)
    end

    # GET /v1/feed/notification
    # This feed can be used to build notification functionality.
    def notification_feed
      authorize :feed
      return head 422 unless has_allowed_params?
      feed = Feed.notification_feed(current_user.id, page_params)
      render_feed(feed)
    end

    private def render_feed(feed)
      if feed == true # if redis is down
        render json: { error: "No access to the redis server." },
               status: :service_unavailable
      else
        render json: feed, status: :ok
      end
    end

    private def page_params
      params.permit(:limit, :offset, :cursor, :style).symbolize_keys
    end

    private def has_allowed_params?
      params[:style].nil? || params[:style].in?(%w(raw flat aggregated))
    end
  end
end
