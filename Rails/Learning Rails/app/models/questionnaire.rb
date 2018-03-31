# == Schema Information
#
# Table name: questionnaires
#
#  id         :integer          not null, primary key
#  question   :string
#  agreement  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Questionnaire < ApplicationRecord
end
