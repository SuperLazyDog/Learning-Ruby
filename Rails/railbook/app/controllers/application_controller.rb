class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_device,:detect_locale
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

    def detect_locale
      I18n.locale = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first
      @locale = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first
      @scan = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first
    end
end
