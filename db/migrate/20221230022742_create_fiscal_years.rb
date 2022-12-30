class CreateFiscalYears < ActiveRecord::Migration[7.0]
  def change
    create_table :fiscal_years do |t|
      t.datetime :date_from
      t.datetime :date_to
      t.string :name, unique: true

      t.timestamps
    end
    add_index :fiscal_years, :name,   unique: true
  end
end
