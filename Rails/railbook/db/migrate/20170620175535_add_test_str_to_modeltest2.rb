class AddTestStrToModeltest2 < ActiveRecord::Migration[5.1]
  def change
    add_column :modeltest2s, :testStr, :string
    add_column :modeltest2s, :testInModeltest2_File, :string
    change_column_default :modeltest2s, :testStr, 'abcdefg'
  end
end
