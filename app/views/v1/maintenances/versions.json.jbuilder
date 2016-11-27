json.versions do
  json.ios do
    json.current ENV.fetch('IOS_CURRENT_CLIENT_VERSION', '0.000')
    json.minimum ENV.fetch('IOS_MINIMUM_CLIENT_VERSION', '0.000')
  end
  json.android do
    json.current ENV.fetch('ANDROID_CURRENT_CLIENT_VERSION', '0.000')
    json.minimum ENV.fetch('ANDROID_MINIMUM_CLIENT_VERSION', '0.000')
  end
end
