# == Schema Information
#
# Table name: ransack_basics
#
#  id         :integer          not null, primary key
#  column_A   :boolean          default(FALSE), not null
#  column_B   :boolean          default(FALSE), not null
#  column_C   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RansackBasic < ApplicationRecord
  has_one :ransack_child, dependent: :destroy

  RANSACK_BASIC_COLUMN = {
    column_A: "BOOL",
    column_B: "BOOL",
    column_C: "BOOL"
  }

end
