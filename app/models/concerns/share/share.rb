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
        intern: 5,
        iframe: 6
      }
    end

    def share_types_index
      %w(webview email qrcode image pdf intern iframe)
    end

    def share_webview(user, slot, params = nil)
      # Store shared objects
      obj = share_objects(user, slot)
      # Generate HTML from slot/user data
      html = Convert.slot_to_html(
        obj[:user],
        obj[:slot],
        style: 'portrait')
      url = create_share_url(:webview, slot)
      path = 'store/share/webview'
      save_to_file(path, "#{url}.html", html)
      # Returns the share URL
      url
    end

    def share_iframe(user, slot, params = nil)
      # Store shared objects
      share_objects(user, slot)
      # Generate HTML from slot/user data
      share_url = share_webview(user, slot)
      # Generate iFrame from given URL
      iframe = Convert.url_to_iframe(share_url)

      url = create_share_url(:iframe, slot)
      path = 'store/share/iframe'
      save_to_file(path, "#{url}.html", iframe)
      # Returns the share URL
      url
    end

    def share_image(user, slot, params = nil)
      # Store shared objects
      obj = share_objects(user, slot)
      # Generate Image from slot/user data
      image = Convert.html_to_image(
        Convert.slot_to_html(
        obj[:user],
        obj[:slot],
        style: 'box'))

      url = create_share_url(:image, slot)
      path = 'store/share/image'
      save_to_file(path, "#{url}.jpg", image)
      # Returns the share URL
      url
    end

    def share_pdf(user, slot, params = nil)
      # Store shared objects
      obj = share_objects(user, slot)
      # Generate HTML from slot/user data
      pdf = Convert.html_to_pdf(
        Convert.slot_to_html(
        obj[:user],
        obj[:slot],
        style: 'pdf'))

      url = create_share_url(:pdf, slot)
      path = 'store/share/pdf'
      save_to_file(path, "#{url}.pdf", pdf)
      # Returns the share URL
      url
    end

    def share_qrcode(user, slot, params = nil)
      # Store shared objects
      share_objects(user, slot)
      # Generate HTML from slot/user data
      share_url = share_webview(user, slot)
      # Generate QR-Code from given URL
      qrcode = Convert.url_to_qrcode(share_url)

      url = create_share_url(:qrcode, slot)
      path = 'store/share/qrcode'
      save_to_file(path, "#{url}.png", qrcode)
      # Returns the share URL
      url
    end

    def create_client
      # this client will be overridden by a stub for rspec testings
      Aws::SES::Client.new
    end

    def share_email(user, slot, params = nil)
      destination = params['email'] || user.email
      return unless destination

      # Store shared objects
      obj = share_objects(user, slot)
      # Generate HTML from slot/user data
      html = Convert.slot_to_html(
        obj[:user],
        obj[:slot],
        style: 'box')
      content = {
        source: user.email || 'support@timeslot.com',
        destination: {
          to_addresses: [destination]
        },
        message: {
          subject: {
            data: "[Timeslot] #{user.username} shared the slot: '#{slot.title}'"
            # charset: "Charset"
          },
          body: {
            text: {
              data: ''
              # charset: "Charset"
            },
            html: {
              data: html
              # charset: "Charset"
            }
          }
        },
        reply_to_addresses: [user.email], # what do we do if no address is set?
        # bounce and complain notifications are forwarded by aws to this address:
        return_path: 'email_monitoring@timeslot.rocks'
      }
      # tmp hack to notify airbrake when an email gets send out
      # TODO: improve
      Airbrake.notify(StandardError, news: 'sending email via AWS SNS',
                      mailtype: 'share email',
                      destination: destination,
                      content: content)
      begin
        # Send as email
        create_client.send_email(content)
      rescue Aws::SES::Errors::ServiceError => exception
        Rails.logger.error { exception }
        Airbrake.notify(exception)
        raise exception if Rails.env.test? || Rails.env.development?
      end
      # Returns true (no response is send back to the client)
      true
    end

    def share_intern(user, slot, params = nil)
      # TODO
    end

    def unshare(slot)
      %W(store/share/webview/#{create_share_url(:webview, slot)}.html
         store/share/iframe/#{create_share_url(:iframe, slot)}.html
         store/share/image/#{create_share_url(:image, slot)}.jpg
         store/share/qrcode/#{create_share_url(:qrcode, slot)}.png
         store/share/pdf/#{create_share_url(:pdf, slot)}.pdf).each do |file|
        File.delete(file) if File.exist?(file)
      end
      # Returns true (no response is send back to the client)
      true
    end

    ## -- HELPERS -- ##

    private def create_share_url(type, slot)
      Base64.urlsafe_encode64("#{share_types_enum[type]}:#{slot.id || slot['id']}")
    end

    private def share_objects(user, slot)
      user_string = ApplicationController.new.render_to_string(
        template: 'v1/users/_user',
        layout: false,
        locals: { user: user }
      )

      slot_string = ApplicationController.new.render_to_string(
        template: 'v1/slots/_slot',
        layout: false,
        locals: { slot: slot, current_user: user }
      )

      @storage.set("User:#{user['id']}", gzip_content(user_string))
      @storage.set("Slot:#{slot['id']}", gzip_content(slot_string))

      { user: JSON.parse(user_string),
        slot: JSON.parse(slot_string) }
    end

    private def save_to_file(path, filepath, file)
      FileUtils.mkdir_p(path) unless File.exist?(path)
      File.open("#{path}/#{filepath}", 'wb') do |f|
        f.write(gzip_content(file))
      end
    end

    private def gzip_content(content)
      ActiveSupport::Gzip.compress(content)
    end

    private def unzip_content(content)
      ActiveSupport::Gzip.decompress(content)
    end
  end
end
