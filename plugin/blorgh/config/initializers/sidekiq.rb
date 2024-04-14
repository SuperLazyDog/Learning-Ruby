REDIS_HASH = {
  url: 'redis://localhost:6379/0',
  namespace: 'blorgh'
}

Sidekiq.configure_server do |config|
  config.redis = REDIS_HASH
  error_handlers = [
    proc {|ex, ctx_hash| puts "UUID weida: Error: #{ex} Context: #{ctx_hash}"},
    proc { |ex, ctx_hash| puts "UUID weida in error_handlers"  }
  ]
  config.error_handlers.push *error_handlers
  config.default_job_options = {
    tags: ['uuid_weida', 'default_job_tag'],
  }

  # config.on(:startup) do
  #   puts "UUID weida: Sidekiq server startup"
  # end
  # config.on(:quiet) do
  #   puts "UUID Weida: server Got TSTP, stopping further job processing..."
  #   # sleep 100
  # end
  # config.on(:shutdown) do
  #   puts "UUID weida: Sidekiq server shutdown"
  # end
  # puts "UUID weida in server: Sidekiq.default_job_options: #{Sidekiq.default_job_options.inspect}"
  config.log_tags += ['uuid_weida_server']
end

Sidekiq.configure_client do |config|
  config.redis = REDIS_HASH
  config.default_job_options = {
    tags: ['uuid_weida', 'default_job_tag'],
  }
  
  # puts "UUID weida in client: Sidekiq.default_job_options: #{Sidekiq.default_job_options.inspect}"
  config.log_tags += ['uuid_weida_client']
end
Blorgh::SidekiqMiddlewareRegister.register
logger = ::Logger.new("#{Rails.root}/log/weida_sidekiq.log", 'daily')
logger.formatter = ::Logger::Formatter.new
Sidekiq.logger = ActiveSupport::TaggedLogging.new(logger)
# Sidekiq.logger.formatter.push_tags('root_pushed_tag')
Sidekiq.log_tags += ['root_pushed_tag2', :retry_queue, :jid]
