# for Rails 5
# https://github.com/rails/rails/pull/20389
# ActionDispatch::Request.parameter_parsers[Mime[:json]] = lambda { |raw_post|
#   data = ActiveSupport::JSON.decode(raw_post)
#   data = { _json: data } unless data.is_a?(Hash)
#   data.deep_transform_keys!(&:underscore)
# }

# for Rails 4
Rails.application.config.middleware.swap(
  ::ActionDispatch::ParamsParser, ::ActionDispatch::ParamsParser,
  ::Mime::JSON => proc { |raw_post|
    # Borrowed from action_dispatch/middleware/params_parser.rb except for
    # data.deep_transform_keys!(&:underscore) :
    data = ::ActiveSupport::JSON.decode(raw_post)
    data = { _json: data } unless data.is_a?(::Hash)
    data = ::ActionDispatch::Request::Utils.deep_munge(data)
    data.deep_transform_keys!(&:underscore)
    data.with_indifferent_access
  }
)
