# == Schema Information
#
# Table name: fan_comments
#
#  id         :integer          not null, primary key
#  author_no  :integer
#  name       :string
#  body       :text
#  deleted    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FanCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
