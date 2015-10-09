# Automatically bulk redis data to backup file every 1 hour
$redis = Redis.new(host: 'localhost', port: 6379, save: '3600 1')
