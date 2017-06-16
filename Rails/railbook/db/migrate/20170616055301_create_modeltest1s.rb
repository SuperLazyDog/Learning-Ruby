class CreateModeltest1s < ActiveRecord::Migration[5.1]
  def change
    create_table :modeltest1s do |t|
      t.integer :a

      t.timestamps
    end
  end
end
