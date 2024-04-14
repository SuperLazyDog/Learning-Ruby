require 'sidekiq'
module Blorgh
  class HardJob
    include Sidekiq::Job
    sidekiq_options queue: 'my_queue', retry_queue: 'my_retry_queue', tags: ['hard', 'heavy']

    def perform(*args)
      # Do something
      # puts "UUID weida: Sidekiq Blorgh::HardJob perform: args.class: #{args.class} *args: #{args}"
      # raise "UUID weida: Sidekiq Blorgh::HardJob perform: raise error"
      # puts "UUID weida: logger: Sidekiq.logger: #{logger.to_yaml}"]
      logger.debug  "UUID weida: Sidekiq Blorgh::HardJob perform: args.class: #{args.class} *args: #{args}, Sidekiq.log_tags: #{Sidekiq.log_tags}"
    end

    def logger
      Sidekiq.logger
    end
  end
end
