# == Schema Information
#
# Table name: modeltest2s
#
#  id                    :integer          not null, primary key
#  modeltest1_id         :integer
#  b                     :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  testStr               :string           default("abcdefg")
#  testInModeltest2_File :string
#

require 'test_helper'

class Modeltest2Test < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
