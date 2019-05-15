# == Schema Information
#
# Table name: modeltest1s
#
#  id         :integer          not null, primary key
#  a          :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Modeltest1 < ApplicationRecord
  has_many :modeltest2s
end
