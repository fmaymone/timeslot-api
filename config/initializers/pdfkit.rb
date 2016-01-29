PDFKit.configure do |config|
  #config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if Rails.env.production?
  config.default_options = {
      :page_size => 'Legal',
      :print_media_type => true
  }
  # Use only if the external hostname is unavailable on the server
  #config.root_url = "http://localhost" unless Rails.env.production?
  config.verbose = false
end
