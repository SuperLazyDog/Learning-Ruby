module Blorgh
  class DummyCronJob < ApplicationJob
    queue_as :default

    def perform(*args)
      # Do something later
      puts "UUID weida: DummyCronJob: perform: #{args}"
    end
  end
end
