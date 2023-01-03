class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, unique: true, null: false
      t.string :description
      t.references :revenue_source, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.string :ward
      t.string :location
      t.string :status
      t.decimal :budgetAmount, precision: 16, scale: 2, default: 0
      t.decimal :spentAmount, precision: 16, scale: 2, default: 0

      t.references :fiscal_year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
