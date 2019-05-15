class CreateModelTests < ActiveRecord::Migration[5.1]
  def change
    create_table :model_tests do |t|
      t.integer :hp
      t.integer :mp
      t.integer :ad
      t.integer :ap
      t.integer :def
      t.integer :mdf
      t.string :phyle
      t.boolean :israre

      t.timestamps
    end
  end
end
