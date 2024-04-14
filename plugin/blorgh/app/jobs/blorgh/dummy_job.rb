module Blorgh
  class DummyJob < ApplicationJob
    queue_as :default_active_job_queue

    def perform(*args)
      # Do something later
      puts "UUID weida: Blorgh::DummyJob perform: args.class: #{args.class} *args: #{args}, Sidekiq.log_tags: #{Sidekiq.log_tags}"
    end
  end
end
