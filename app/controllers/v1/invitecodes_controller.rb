module V1
  class InvitecodesController < ApplicationController
    skip_before_action :authenticate_user_from_token!,
                       except: [:create]
    # POST /v1/invitecodes/
    def create
      authorize :invitecode

      params.require :user_id
      params.require :relation
      params.permit(:user_id, :relation)

      @invitecode = Invitecode.create(user_id: params[:user_id],
                                      relation: params[:relation])
      if @invitecode.persisted?
        render :create, status: :created, locals: { invitecode: @invitecode }
      else
        render json: { error: @invitecode.errors },
               status: :unprocessable_entity
      end
    end

    # GET /v1/invitecodes/:code
    def show
      authorize :invitecode

      params.require :code
      params.permit(:code)

      @invitecode = Invitecode.find_by_code(params[:code])

      if @invitecode.nil?
        head :not_found
      elsif @invitecode.errors.empty?
        render :show, locals: { invitecode: @invitecode }
      else
        render json: { error: @invitecode.errors },
               status: :not_found
      end
    end
  end
end
