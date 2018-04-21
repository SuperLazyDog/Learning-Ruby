class CreateRansackChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :ransack_children do |t|
      t.belongs_to :ransack_basic, foreign_key: true
      RansackChild::RANSACK_CHILD_COLUMN.each_key do |k|
        t.boolean k, null: false, default: false
      end
      t.timestamps
    end
  end
end
