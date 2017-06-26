require 'bcrypt'
#require 'nkf'

class Customer < ActiveRecord::Base
  # (省略)

  class << self
    def authenticate(username, password)
      customer = find_by_username(username)
      if customer.try(:password_digest) && BCrypt::Password.new(customer.password_digest) == password
        customer
      else
        nil
      end
    end
  end
end
