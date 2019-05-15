# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  birth      :date
#  address    :text
#  ctype      :string
#  photo      :binary
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
