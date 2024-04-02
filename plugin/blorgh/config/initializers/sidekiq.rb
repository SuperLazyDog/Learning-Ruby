REDIS_HASH = {
  url: 'redis://localhost:6379/0',
  namespace: 'blorgh'
}

Sidekiq.configure_server do |config|
  config.redis = REDIS_HASH
end

Sidekiq.configure_client do |config|
  config.redis = REDIS_HASH
end
