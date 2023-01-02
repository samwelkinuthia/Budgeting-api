class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.references :county, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
    add_index :departments, [:name, :county_id], unique: true
  end
end
