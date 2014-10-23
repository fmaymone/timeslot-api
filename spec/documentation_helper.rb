require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  # Set the application that Rack::Test uses
  config.app = Rails.application

  # Output folder
  config.docs_dir = Rails.root.join("doc", "api")

  # An array of output format(s).
  # Possible values are :json, :html, :combined_text, :combined_json,
  #   :json_iodocs, :textile, :markdown, :append_json
  # config.format = [:json, :combined_text, :html]
  config.format = [:markdown, :json]

  # Location of templates
  # config.template_path = "inside of the gem"

  # Filter by example document type
  config.filter = :all

  # Filter by example document type
  config.exclusion_filter = nil

  # Used when adding a cURL output to the docs
  # config.curl_host = nil
  config.curl_host = 'http://localhost:3000'

  # Used when adding a cURL output to the docs
  # Allows you to filter out headers that are not needed in the cURL request,
  # such as "Host" and "Cookie". Set as an array.
  config.curl_headers_to_filter = ["Cookie"]

  # By default, when these settings are nil, all headers are shown,
  # which is sometimes too chatty. Setting the parameters to an
  # array of headers will render *only* those headers.
  config.request_headers_to_include = nil
  config.response_headers_to_include = nil

  # By default examples and resources are ordered by description.
  # Set to true keep the source order.
  config.keep_source_order = false

  # Change the name of the API on index pages
  config.api_name = 'Timeslot API'

  # Redefine what method the DSL thinks is the client
  # This is useful if you need to `let` your own client, most likely a model.
  # config.client_method = :client

  # Change the IODocs writer protocol
  config.io_docs_protocol = 'http'

  # You can define documentation groups as well.
  # A group allows you generate multiple sets of documentation.
  config.define_group :v1 do |config|
    # By default the group's doc_dir is a subfolder under the parent group,
    # based on the group's name.
    config.docs_dir = Rails.root.join('doc', 'api', 'v1')

    # Change the filter to only include :v1 examples
    config.filter = :v1
    config.api_name = "API V1"
  end

  config.define_group :v2 do |config|
    config.filter = :v2
    config.docs_dir = Rails.root.join("doc", "api", "v2")
    config.api_name = "API V2"
  end

  # Change how the post body is formatted by default,
  # you can still override by `raw_post`
  # Can be :json, :xml, or a proc that will be passed the params
  # config.post_body_formatter = proc { |params| params }
  config.post_body_formatter = :json

  # Change the embedded style for HTML output. This file will not
  # be processed by RspecApiDocumentation and should be plain CSS.
  config.html_embedded_css_file = nil
end
