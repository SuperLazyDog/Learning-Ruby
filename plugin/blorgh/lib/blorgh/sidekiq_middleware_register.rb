module Blorgh::SidekiqMiddlewareRegister
  def self.register
    puts "UUID weida: Blorgh::SidekiqMiddlewareRegister register"
    Sidekiq.configure_server do |config|
      config.server_middleware do |chain|
        chain.add Blorgh::SidekiqMiddlewares::Server::OutputTagsMiddleware
        chain.prepend Blorgh::SidekiqMiddlewares::Server::LoggerMiddleware
        # chain.add Blorgh::SidekiqMiddlewares::Server::DisablePerformMiddleware
      end

      config.client_middleware do |chain|
        chain.add Blorgh::SidekiqMiddlewares::Client::InputTagsMiddleware, 'test_parameter_tag1'
      end
    end

    Sidekiq.configure_client do |config|
      config.client_middleware do |chain|
        chain.add Blorgh::SidekiqMiddlewares::Client::InputTagsMiddleware, 'test_parameter_tag1'
      end
    end
  end
end
