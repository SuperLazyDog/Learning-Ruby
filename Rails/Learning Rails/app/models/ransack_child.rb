# == Schema Information
#
# Table name: ransack_children
#
#  id               :integer          not null, primary key
#  ransack_basic_id :integer
#  column_A         :boolean          default(FALSE), not null
#  column_B         :boolean          default(FALSE), not null
#  column_C         :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class RansackChild < ApplicationRecord
  belongs_to :ransack_basic
  RANSACK_CHILD_COLUMN = {
    column_A: "BOOL",
    column_B: "BOOL",
    column_C: "BOOL"
  }
end
