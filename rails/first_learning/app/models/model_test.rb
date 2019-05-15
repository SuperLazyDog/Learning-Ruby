# == Schema Information
#
# Table name: model_tests
#
#  id         :integer          not null, primary key
#  hp         :integer
#  mp         :integer
#  ad         :integer
#  ap         :integer
#  def        :integer
#  mdf        :integer
#  phyle      :string
#  israre     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ModelTest < ApplicationRecord
  scope :rare, -> { where('israre = :israre', israre: true) }
  #scope :normal, -> { where('israre = :israre', israre: false) }
  scope :normal, -> { where.not('israre = :israre', :israre => true) }
  scope :order_with_hp, ->{ order(:hp) }
  scope :order_with_hp_desc, -> { order(:hp => :desc)}
  #default_scope
  #default_scope { order_with_hp }

  #回调函数
  # TODO: 之前跳过了一部分回调函数的实现 p297
  after_initialize :callBackTest

  private
    def callBackTest

    end
end
