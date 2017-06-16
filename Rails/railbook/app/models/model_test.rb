class ModelTest < ApplicationRecord
  scope :rare, -> { where('israre = :israre', israre: true) }
  #scope :normal, -> { where('israre = :israre', israre: false) }
  scope :normal, -> { where.not('israre = :israre', :israre => true) }
  scope :order_with_hp, ->{ order(:hp) }
  scope :order_with_hp_desc, -> { order(:hp => :desc)}
  #default_scope
  #default_scope { order_with_hp }
end
