# Automatically bulk redis data to backup file every 1 hour
if Rails.env.production?
  $redis = Redis.new(url: ENV['REDIS_URL'], save: '3600 1')
else
  # $redis = Aws::ElastiCache::Client.new(
  #     region: 'us-west-2a',
  #     credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  # )
  #$redis = Redis.new(host: 'activity.et8igu.0001.usw2.cache.amazonaws.com', port: '6379', save: '3600 1')
  $redis = Redis.new(host: 'localhost', port: 6379, save: '3600 1') #, password: "ts_redis"
end
