require 'sidekiq'
require 'sidekiq/job_logger'
module Blorgh::SidekiqMiddlewares
  extend ActiveSupport::Concern

  module TagHelper
    LOG_TAGS_KEY = :_tags.to_s

    def self.push_tags(msg, *tags)
      msg[LOG_TAGS_KEY] = (msg[LOG_TAGS_KEY] || [] ).push *tags
    end

    def self.origin_tags(msg)
      msg[LOG_TAGS_KEY]
    end

    # job level log tags
    def self.compute_tags(msg)
      (msg[LOG_TAGS_KEY] || []).map do |tag|
        case tag
        # when Proc
        #   tag.call(msg)
        # when Symbol
        #   request.send(tag)
        when Array
          tag.map { |t| t.to_s }
        else
          tag.to_s
        end
      end.flatten
    end

    # top level log tags
    def self.compute_log_tags(msg)
      Sidekiq.log_tags.map do |tag|
        case tag
        when Proc
          tag.call(msg)
        when Symbol
          msg[tag.to_s]
        when Array
          tag.map { |t| t.to_s }
        else
          tag.to_s
        end
      end.flatten
    end
  end

  # override sidekiq
  module ::Sidekiq
    mattr_accessor :log_tags
    @@log_tags = [].freeze

    # override Sidekiq::JobLogger
    JobLogger.class_eval do
      delegate :compute_log_tags, to: Blorgh::SidekiqMiddlewares::TagHelper
      alias_method :__initialize__, :initialize
      def initialize(logger=Sidekiq.logger)
        logger = ActiveSupport::TaggedLogging.new(logger) unless logger.respond_to?(:tagged)
        __initialize__(logger)
      end

      alias_method :__call__, :call
      def call(item, queue, &block)
        if @logger.respond_to?(:tagged)
          tags = compute_log_tags(item)
          puts "UUID weida: top level tags: #{tags}"
          @logger.tagged(*tags) { __call__(item, queue, &block) }
        else
          __call__(item, queue, &block)
        end
      end
    end
  end

  module ::Sidekiq::Cron
    class Job
      class_eval do
        alias_method :__initialize__, :initialize
        def initialize input_args = {}
          puts "UUID weida: Sidekiq::Cron::Job initialize: #{input_args}"
          __initialize__(input_args)
        end
      end
    end
  end

  # server middlewares
  module Server
    class OutputTagsMiddleware
      include ::Sidekiq::ServerMiddleware
      delegate :origin_tags, to: Blorgh::SidekiqMiddlewares::TagHelper
      def call(job_instance, msg, queue, &block)
        # puts "UUID weida: Server::OutputTagsMiddleware LOG_TAGS: #{origin_tags(msg)}"
        yield
      end
    end

    class LoggerMiddleware
      include ::Sidekiq::ServerMiddleware
      delegate :compute_tags, to: Blorgh::SidekiqMiddlewares::TagHelper
      def call(job_instance, msg, queue, &block)
        if logger.respond_to?(:tagged)
          puts "UUID weida: job level tags: #{compute_tags(msg)}"
          logger.tagged('dummy_job_tag', *compute_tags(msg)) { yield }
        else
          yield
        end
      end
  
      def logger
        Sidekiq.logger
      end
    end

    class DisablePerformMiddleware
      include ::Sidekiq::ServerMiddleware
      def call(job_instance, msg, queue, &block)
        puts "UUID weida: DisablePerformMiddleware"
      end
    end
  end

  # client middlewares
  module Client
    class InputTagsMiddleware
      include ::Sidekiq::ClientMiddleware
      delegate :push_tags, to: Blorgh::SidekiqMiddlewares::TagHelper
      attr_accessor :tags
      def initialize(tags=[])
        self.tags = tags
      end

      def call(job_class, msg, queue, redis_pool, &block)
        push_tags(msg, *tags)
        # puts "UUID weida: Client::InputTagsMiddleware msg: #{msg}"
        yield
      end
    end
  end
end
