module V1
  # May 'open-uri' is required to forward https requests:
  # require 'open-uri'

  class ShareController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :redirect
    skip_after_action :verify_authorized, only: :redirect

    ## -- REDIRECT SHARE URL -- ##

    # GET /v1/
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
            # Render from cached final view:
            #render html: result.html_safe, content_type: "text/html"
            # Render from cached data ("Live Enrich"):
            data_handler(result.html_safe, 'text/html')
          when 'qrcode'
            data_handler(result, 'image/png')
          when 'pdf'
            data_handler(result, 'application/pdf')
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
      share_handler(:webview)
    end

    # POST /v1/share/1/image
    def image
      share_handler(:image)
    end

    # POST /v1/share/1/qrcode
    def qrcode
      share_handler(:qrcode)
    end

    # POST /v1/share/1/pdf
    def pdf
      share_handler(:pdf)
    end

    # POST /v1/share/1/email
    def email
      share_handler(:email)
    end

    # POST /v1/share/1/intern
    def intern
      # TODO: Share As Internal App Forwarding
      #share_handler(:intern)
    end

    # DELETE /v1/share/1/
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

    private def slot_is_public(slot)
      slot.try(:visibility) == 'public'
    end

    private def data_handler(result, type)
      send_data(result, filename: "slot-#{params[:id]}.#{type.split('/')[1]}",
                        type: type,
                        disposition: 'inline')
    end

    private def share_handler(type)
      slot = BaseSlot.get(params[:id])
      authorize :share

      if slot_is_public(slot)
        # Delegate to the related share method
        if (url = Share.send("share_#{type}", current_user, slot, params))
          # Check if a response has to be returned to the client
          if url == true
            head :ok
          else
            render json: { shareId: url,
                           shareUrl: "#{ENV['SHARE_HOST_URL']}/v1/?id=#{url}" }
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

    private def error_handler(error, msg, params = {})
      Rails.logger.error { error }
      Airbrake.notify(msg, params.merge(error: error))
      puts error
    end
  end
end
