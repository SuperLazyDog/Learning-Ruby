class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.string :question
      t.boolean :veryAgree
      t.boolean :agree
      t.boolean :disagree
      t.boolean :veryDisagree

      t.timestamps
    end
  end
end
