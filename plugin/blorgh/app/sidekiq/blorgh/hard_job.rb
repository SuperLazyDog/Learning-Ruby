module Blorgh
  class HardJob
    include Sidekiq::Job

    def perform(*args)
      # Do something
      puts "UUID weida: Sidekiq Blorgh::HardJob perform: args.class: #{args.class} *args: #{args}"
    end
  end
end
