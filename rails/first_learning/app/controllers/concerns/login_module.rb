module LoginModule
  extend ActiveSupport::Concern
  included do
    before_action :login
  end

  private
    def login
      #render plain: 'login module test successfully'
    end
end
