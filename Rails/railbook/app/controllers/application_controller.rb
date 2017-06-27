class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_device
  add_flash_types :test_flash
  add_flash_types :info

  
  private
    def detect_device
      case params[:type]
        when 'mobile'
          render plain: 'mobile'
        when 'tablet'
          render plain: 'tablet'
      end
    end

end
