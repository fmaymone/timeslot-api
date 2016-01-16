module Share

  @storage = RedisStorage

  class << self

    def share_types_enum
      {
          webview: 0,
          email: 1,
          qrcode: 2,
          image: 3,
          pdf: 4,
          intern: 5
      }
    end

    def share_types_index
      %w(webview email qrcode image pdf intern)
    end

    def share_webview(user, slot)
      # Store shared objects
      @storage.set("User:#{user.id}", gzip_content(JSONView.user(user).to_json))
      @storage.set("Slot:#{slot.id}", gzip_content(JSONView.slot(slot).to_json))
      # Returns the share URL
      create_share_url(:webview, user, slot)
    end

    def share_image(user, slot)
      # Generate HTML from slot/user data
      image = Convert.html_to_image(Convert.slot_to_html(
          JSONView.user(user), JSONView.slot(slot)
      ), style: 'portrait')

      url = create_share_url(:image, user, slot)
      path = 'store/share/image'

      # Save image to file
      FileUtils.mkdir_p(path) unless File.exists?(path)
      File.open("#{path}/#{url}.jpg", 'wb') do |f|
        f.write(gzip_content(image))
      end
      # Returns the share URL
      url
    end

    def share_qrcode(user, slot)
      # Generate HTML from slot/user data
      share_url = share_webview(user, slot)
      # Generate QR-Code from given URL
      image = Convert.url_to_qrcode(share_url)
      # Apply public sharing URL
      url = create_share_url(:qrcode, user, slot)
      path = 'store/share/qrcode'

      # Save image to file
      FileUtils.mkdir_p(path) unless File.exists?(path)
      File.open("#{path}/#{url}.png", 'wb') do |f|
        f.write(gzip_content(image))
      end
      # Returns the share URL
      url
    end

    def share_pdf(user, slot)
      # Generate HTML from slot/user data
      pdf = Convert.html_to_pdf(Convert.slot_to_html(
          JSONView.user(user),
          JSONView.slot(slot)
      ))
      url = create_share_url(:pdf, user, slot)
      path = 'store/share/pdf'

      # Save image to file
      FileUtils.mkdir_p(path) unless File.exists?(path)
      File.open("#{path}/#{url}.pdf", 'wb') do |f|
        f.write(gzip_content(pdf))
      end
      # Returns the share URL
      url
    end

    def share_email(user, slot)
      # TODO
    end

    def share_intern(user, slot)
      # TODO
    end

    ## -- HELPERS -- ##

    private def create_share_url(type, user, slot)
      # Returns base64 without padding
      Base64.urlsafe_encode64("#{user.id}:#{share_types_enum[type]}:#{slot.id}").gsub('=', '')
    end

    # private def create_share_url(type, user, target)
    #   length = ENV['SHARE_URL_MIN_LENGTH'] || 3
    #   dupes = 0
    #   while @storage.exists((url = "SHARE:#{share_types_enum[type]}:#{Digest::SHA1.hexdigest("#{user}#{target}#{type}").slice(0, length).downcase}")) do
    #     length += 1 and (dupes = 0) if dupes += 1 > 3
    #   end
    #   url
    # end

    private def gzip_content(content)
      ActiveSupport::Gzip.compress(content)
    end

    private def unzip_content(content)
      ActiveSupport::Gzip.decompress(content)
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
