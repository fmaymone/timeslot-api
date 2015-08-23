class V1::SearchController < ApplicationController

  def index
    authorize :search
    # default route to "v1/search/"
    # here we can add multi search
    head 422
  end

  def user
    authorize :search

    @users = Search.result(User,
                           params[:attr] || :username,
                           query_params,
                           page_params)

    render "v1/users/index"
  end

  def email
    authorize :search
    @users = Search.result(User,
                           params[:attr] || :email,
                           query_params,
                           page_params)

    render "v1/users/index"
  end

  def media
    authorize :search
    @media_items = Search.result(MediaItem,
                                 params[:attr] || :title,
                                 query_params,
                                 page_params)

    render "v1/media/index"
  end

  def slot
    authorize :search
    @slots = Search.result(MetaSlot,
                           params[:attr] || :title,
                           query_params,
                           page_params)

    @slots = BaseSlot.where(meta_slot_id: @slots.collect(&:id)) unless @slots.empty?

    render "v1/slots/index"
  end

  private def query_params
    "%" << params.require(:query)
                 .gsub(' ', '%')
                 .gsub(/[^a-zA-Z0-9%@-_.]/, "") << "%"
  end

  private def page_params
    params.permit(:page, :limit).symbolize_keys
  end

  # private def filter_params
  #   params.permit(:include, :exclude).symbolize_keys
  # end

  # private def scope_params
  #   params.require(:scope).permit(:private, :public, :friend, :group).symbolize_keys if params[:scope].present?
  # end
end
