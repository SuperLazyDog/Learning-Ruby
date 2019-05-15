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

class Modeltest2 < ApplicationRecord
  belongs_to :modeltest1
  #改变迁移文件上定义的数据类型
  #attribute :b, :float
end
