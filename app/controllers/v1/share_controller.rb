module V1
  require 'open-uri'

  class ShareController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :redirect
    skip_after_action :verify_authorized, only: :redirect

    ## -- REDIRECT SHARE URL -- ##

    # GET /v1/:id
    def redirect
      if params[:id].present?

        # Determine params
        url = Redirect.decode_share_url(params[:id]).split(':')
        type = Share.share_types_index[url[0].to_i]
        result = Redirect.show(type, params[:id])

        # Dispatch type of views
        if result
          case type
          when 'image'
            data_handler(result, 'image/jpg')
          when 'webview'
            #render html: result.html_safe, content_type: "text/html"
            data_handler(result.html_safe, 'text/html')
          when 'qrcode'
            data_handler(result, 'image/png')
          when 'pdf'
            data_handler(result, 'application/pdf')
          when 'email'
            # Will perform aync through configured active job controller (Sucker Punch)
            SlotMailer.slot_as_email(user).deliver_later
          else
            head 422
          end
        else
          head 404
        end
      end
    rescue => error
      error_handler(error, "failed: redirect to shared view")
    end

    ## -- SHARING TYPES -- ##

    # POST /v1/share/1/webview
    def webview
      authorize :share
      share_handler(:webview)
    end

    # POST /v1/share/1/image
    def image
      authorize :share
      share_handler(:image)
    end

    # POST /v1/share/1/qrcode
    def qrcode
      authorize :share
      share_handler(:qrcode)
    end

    # POST /v1/share/1/pdf
    def pdf
      authorize :share
      share_handler(:pdf)
    end

    # POST /v1/share/1/email
    def email
      authorize :share
      share_handler(:email)
    end

    # POST /v1/share/1/intern
    def intern
      authorize :share
      slot = BaseSlot.get(params[:id])

      if slot.set_share_id(current_user)
        render 'v1/slots/show', locals: { slot: slot }
      else
        render json: slot.errors.messages,
               status: :unprocessable_entity
      end
    end

    def delete
      authorize :share
      slot = BaseSlot.get(params[:id])

      if slot
        if Share.unshare(slot)
          head :ok
        else
          head 500
        end
      else
        head 404
      end
    rescue => error
      error_handler(error, "failed: unshare views")
    end

    ## -- HANDLERS -- ##

    private def data_handler(result, type)
      send_data(result, filename: "slot-#{params[:id]}.#{type.split('/')[1]}",
                        type: type,
                        disposition: 'inline')
    end

    private def share_handler(type)
      if (slot = BaseSlot.get(params[:id]))
        # Delegate to the related share method
        if (url = (Share.send("share_#{type}", current_user, slot, params)))
          # Check if a response has to be returned to the client
          if url == true
            head :ok
          else
            host = Rails.env.production? ? ENV['SHARE_URL_HOST_PUBLIC'] : ENV['SHARE_URL_HOST_LOCAL']
            render json: { shareId: url,
                           shareUrl: "#{host}/v1/?id=#{url}" }
          end
        else
          head 500
        end
      else
        head 404
      end
    rescue => error
      error_handler(error, "failed: create shared view")
    end

    private def error_handler(error, msg, params = nil)
      opts = {}
      opts[:parameters] = { msg: msg }
      opts[:parameters][:params] = params if params
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end
end
