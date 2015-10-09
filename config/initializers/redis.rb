# Automatically bulk redis data to backup file every 1 hour
if Rails.env.production?
  $redis = Redis.new(host: ENV['REDIS_URL'], port: ENV['REDIS_PORT'], save: '3600 1')
else
  $redis = Redis.new(url: 'redis://localhost:6379', save: '3600 1')
end
