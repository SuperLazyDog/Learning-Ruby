require 'sidekiq'
require 'sidekiq-cron'
require 'sidekiq/web'
require 'sidekiq/cron/web'
Dir[File.join(File.dirname(__FILE__), '**', '*.rb')].each { |f| require f }
module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh
  end
end
