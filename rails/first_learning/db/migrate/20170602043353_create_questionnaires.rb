class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.string :question
      t.integer :agreement

      t.timestamps
    end
  end
end
