module Blorgh::RailsMiddlewares
  class OutputMiddleware
    def initialize(app, options = {})
      @app = app
      @options = options
    end

    def call(env)
      puts "UUID: weida Blorgh::RailsMiddlewares::OutputMiddleware: scope: #{@options[:scope]}"
      response = @app.call(env)
      response
    end
  end

  class BeforeRackMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      puts "UUID: weida Blorgh::RailsMiddlewares::BeforeRackMiddleware"
      response = @app.call(env)
      response
    end
  end

  class AfterRackMiddleware
    def initialize(app)
      @app = app
    end
    
    def call(env)
      puts "UUID: weida Blorgh::RailsMiddlewares::AfterRackMiddleware"
      response = @app.call(env)
      response
    end
  end
end
