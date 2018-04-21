class CreateRansackBasics < ActiveRecord::Migration[5.1]
  def change
    create_table :ransack_basics do |t|
      RansackBasic::RANSACK_BASIC_COLUMN.each_key do |k|
        t.boolean k, null: false, default: false
      end
      t.timestamps
    end
  end
end
