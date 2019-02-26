# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  isbn       :string
#  title      :string
#  price      :integer
#  publish    :string
#  published  :date
#  dl         :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
