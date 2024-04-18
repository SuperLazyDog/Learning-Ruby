require 'sidekiq'
require 'sidekiq-cron'
require 'sidekiq/web'
require 'sidekiq/cron/web'
Dir[File.join(File.dirname(__FILE__), '**', '*.rb')].each { |f| require f }
module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh

    # build_middleware_stack will frozen the middleware stack, so we need to insert before build_middleware_stack
    initializer 'build_middleware_stack', before: :build_middleware_stack  do |app|
      RailsMiddlewareRegister.register
      RailsMiddlewareRegister.register_app
    end
  end
end
