class CreateModeltest2s < ActiveRecord::Migration[5.1]
  def change
    create_table :modeltest2s do |t|
      t.integer :modeltest1_id
      t.integer :b

      t.timestamps
    end
  end
end
