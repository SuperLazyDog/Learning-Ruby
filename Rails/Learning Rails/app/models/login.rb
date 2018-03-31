# == Schema Information
#
# Table name: logins
#
#  id              :integer          not null, primary key
#  user            :string
#  password_digest :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Login < ApplicationRecord
  has_secure_password
end
