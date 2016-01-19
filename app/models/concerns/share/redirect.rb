module Redirect

  @storage = RedisStorage

  class << self

    def show(method, target)
      # Delegate to the related method
      send("show_#{method.to_s}", target)
    end

    def decode_share_url(base64)
      # Determine base64 padding (multiple of 4 bytes)
      padding = ''
      (base64.length % 4).times{ padding << '=' }
      # Decode and apply padding
      Base64.urlsafe_decode64("#{base64}#{padding}")
    end

    ## -- REDIRECTS -- ##

    private def show_webview(url)
      # url = decode_share_url(url).split(':')
      # # Retrieve shared objects
      # slot = unzip_data(@storage.get("Slot:#{url[1]}"))
      # user = unzip_data(@storage.get("User:#{slot['creator']['id']}"))
      # # Generate HTML from slot/user data
      # Convert.slot_to_html(user, slot, style: 'portrait')
      get_content(url, 'webview', '.html')
    end

    private def show_image(url)
      get_content(url, 'image', '.jpg')
    end

    private def show_pdf(url)
      get_content(url, 'pdf', '.pdf')
    end

    private def show_qrcode(url)
      get_content(url, 'qrcode', '.png')
    end

    ## -- HELPERS -- ##

    private def get_content(url, type, file)
      path = "store/share/#{type}/#{url}#{file}"
      if File.exists?(path)
        unzip_content(File.read(path, mode: 'rb'))
      else
        false
      end
    end

    private def gzip_content(content)
      ActiveSupport::Gzip.compress(content)
    end

    private def unzip_content(content)
      ActiveSupport::Gzip.decompress(content)
    end

    private def unzip_data(content)
      JSON.parse(unzip_content(content))
    end

    private def error_handler(error, feed, params)
      opts = {}
      opts[:parameters] = {
          feed: feed,
          params: params
      }
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end
end
