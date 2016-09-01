module Redirect

  class << self

    def show(method, target)
      # Delegate to the related method
      send("show_#{method}", target)
    end

    def decode_share_url(base64)
      Base64.urlsafe_decode64(base64)
    end

    ## -- REDIRECTS -- ##

    private def show_webview(url)
      # Build Live:
      # TODO: Use this snippet for rake task (re-build shared views)
      # url = decode_share_url(url).split(':')
      # # Retrieve shared objects
      # slot = unzip_json(@storage.get("Slot:#{url[1]}"))
      # user = unzip_json(@storage.get("User:#{slot['creator']['id']}"))
      # # Generate HTML from slot/user data
      # Convert.slot_to_html(user, slot, style: 'portrait')

      # Get from Cache:
      get_content(url, 'webview', '.html')
    end

    private def show_iframe(url)
      get_content(url, 'iframe', '.html')
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
      if File.exist?(path)
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

    private def unzip_json(content)
      JSON.parse(unzip_content(content))
    end
  end
end
