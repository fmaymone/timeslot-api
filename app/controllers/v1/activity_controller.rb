#require 'sse'
module V1
  class ActivityController < ApplicationController

    # GET /v1/users/1/feed
    def user_feed
      authorize :activity

      render json: paginate(
                 StreamRails.feed_manager
                            .get_user_feed(current_user.id)
             ),
             status: :ok
    end

    # GET /v1/users/1/news
    def news_feed
      authorize :activity

      render json: paginate(
                 StreamRails.feed_manager
                            .get_news_feeds(current_user.id)
             ),
             status: :ok
    end

    # GET /v1/users/1/notification
    def notification_feed
      authorize :activity

      render json: paginate(
                 StreamRails.feed_manager
                            .get_notification_feed(current_user.id)
             ),
             status: :ok
    end

    private def paginate(result)
      result.get(limit: params.permit(:limit) || 20,
                 offset: params.permit(:offset) || 0)
    end
  end
end
