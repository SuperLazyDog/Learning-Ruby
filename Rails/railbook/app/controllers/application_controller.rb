class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_device
  add_flash_types :test_flash
  add_flash_types :info
  after_action :debug_mode_in_server

  private
    def detect_device
      case params[:type]
        when 'mobile'
          render plain: 'mobile'
        when 'tablet'
          render plain: 'tablet'
      end
    end

  def debug_mode_in_server
    case ENV['RAILS_ENV']
    when "development", "test"
        puts %q(-------------------------------------------------------------------)
        puts %q(                        debugger mode)
        puts %q(-------------------------------------------------------------------)
        puts %Q(environment: #{ENV['RAILS_ENV']})
        puts %q(------------------------------------------)
        puts %q(                params)
        puts %q(------------------------------------------)
        if params.present?
          pp params
          ap params#.permit(:action, :controller)
        end
        puts %Q(\n\n)
        # puts %q(                       finish debugger)
        # puts %q(-------------------------------------------------------------------)
      when "production"
    end
  end

end
