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

class Memo < ApplicationRecord
  belongs_to :memoable, polymorphic: true
end
