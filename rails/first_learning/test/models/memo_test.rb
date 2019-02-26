# == Schema Information
#
# Table name: memos
#
#  id            :integer          not null, primary key
#  memoable_type :string
#  memoable_id   :integer
#  body          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
