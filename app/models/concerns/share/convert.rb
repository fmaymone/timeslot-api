module Convert

  ## -- GENERATORS -- ##

  def self.slot_to_html(user, slot, style: 'box')
    ApplicationController.new.render_to_string(
        template: 'v1/share/webview/index',
        layout: false,
        locals: {
            :@user => user,
            :@slot => slot,
            :@style => style
        }
    )
  end

  def self.html_to_image(html, type: 'jpeg', style: 'box', quality: 95)
    kit = IMGKit.new(html, quality: quality)
    kit.stylesheets << "app/views/v1/share/webview/css/all.css"
    kit.stylesheets << "app/views/v1/share/webview/css/#{style}.css"
    kit.javascripts << "app/views/v1/share/webview/js/main.js"
    kit.send("to_#{type}")
  end

  def self.html_to_pdf(html, style: 'pdf')
    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.stylesheets << "app/views/v1/share/webview/css/all.css"
    kit.stylesheets << "app/views/v1/share/webview/css/#{style}.css"
    kit.to_pdf
  end

  def self.url_to_qrcode(share_url, size: 512, border_modules: 4, module_px_size: 6)
    host = Rails.env.production? ? ENV['SHARE_URL_HOST_PUBLIC'] : ENV['SHARE_URL_HOST_LOCAL']
    qrcode = RQRCode::QRCode.new("#{host}/v1/?id=#{share_url}")
    # Specify default options
    qrcode.as_png(
        resize_gte_to: false,
        resize_exactly_to: false,
        fill: 'white',
        color: 'black',
        size: size,
        border_modules: border_modules,
        module_px_size: module_px_size,
        file: nil # path to write
    )
  end
end
