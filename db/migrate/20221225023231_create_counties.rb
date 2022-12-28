class CreateCounties < ActiveRecord::Migration[7.0]
  def change
    create_table :counties do |t|
      t.string :name, unique: true, null: false
      t.string :code, unique: true, null: false

      t.timestamps
    end
    add_index :counties, :code, unique: true
    add_index :counties, :name, unique: true
  end
end
