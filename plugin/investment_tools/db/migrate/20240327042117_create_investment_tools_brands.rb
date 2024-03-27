class CreateInvestmentToolsBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :investment_tools_brands do |t|
      t.text :name
      t.integer :amount
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
