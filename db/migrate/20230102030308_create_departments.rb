class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.references :county, null: false, foreign_key: true
      t.string :name
      t.decimal :totalBudget, precision: 16, scale: 2, default: 0
      t.decimal :developmentBudget, precision: 16, scale: 2, default: 0
      t.decimal :recurrentBudget, precision: 16, scale: 2, default: 0
      t.decimal :pendingBills, precision: 16, scale: 2, default: 0

      t.timestamps
    end
    add_index :departments, [:name, :county_id], unique: true
  end
end
