module V1
  class InvitecodesController < ApplicationController
    skip_before_action :authenticate_user_from_token!,
                       only: [:show]
    # POST /v1/invitecodes/
    def create
      authorize :invitecode

      user_id = params.require(:user_id)

      return head :unprocessable_entity if user_id != current_user.id

      invitecode = Invitecode.create(user_id: user_id,
                                      context: params.require(:context))
      if invitecode.persisted?
        render :create, status: :created, locals: { invitecode: invitecode }
      else
        render json: { error: invitecode.errors },
               status: :unprocessable_entity
      end
    end

    # GET /v1/invitecodes/:code
    def show
      authorize :invitecode

      invitecode = Invitecode.active.find_by(code: params.require(:code))

      if invitecode.nil?
        head :not_found
      elsif invitecode.errors.empty?
        render :show, locals: { invitecode: invitecode }
      else
        render json: { error: invitecode.errors },
               status: :not_found
      end
    end
  end
end
