module Blorgh::RailsMiddlewareRegister
  def self.register
    puts "UUID: weida Blorgh::RailsMiddlewareRegister register"
    # Blorgh::Engine.middleware.use Blorgh::RailsMiddlewares::OutputMiddleware, scope: "engine 1"
    # Blorgh::Engine.middleware.use Blorgh::RailsMiddlewares::OutputMiddleware, scope: "engine 2"
  end

  def self.register_app
    puts "UUID: weida Blorgh::RailsMiddlewareRegister register_app"
    # Rails.application.config.middleware.use Blorgh::RailsMiddlewares::OutputMiddleware, scope: "application 1"
    # Rails.application.config.middleware.use Blorgh::RailsMiddlewares::OutputMiddleware, scope: "application 2"
    # Rails.application.config.middleware.insert_before Rails::Rack::Logger, Blorgh::RailsMiddlewares::BeforeRackMiddleware
    # Rails.application.config.middleware.insert_after Rails::Rack::Logger, Blorgh::RailsMiddlewares::AfterRackMiddleware
  end
end
