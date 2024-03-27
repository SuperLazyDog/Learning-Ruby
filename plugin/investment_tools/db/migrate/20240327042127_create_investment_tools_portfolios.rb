class CreateInvestmentToolsPortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :investment_tools_portfolios do |t|
      t.float :target_percentage

      t.timestamps
    end
  end
end
