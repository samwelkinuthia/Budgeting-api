class CreateCountyBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :county_budgets do |t|
      t.references :fiscal_year, null: false, foreign_key: true
      t.references :county, null: false, foreign_key: true
      t.decimal :totalBudget, precision: 16, scale: 2
      t.decimal :totalExpenditure, precision: 16, scale: 2
      t.decimal :totalRevenue, precision: 16, scale: 2
      t.decimal :totalPendingBills, precision: 16, scale: 2
      t.decimal :absorptionRate, precision: 5, scale: 2
      t.decimal :totalBalance, precision: 16, scale: 2

      t.timestamps
    end
  end
end
