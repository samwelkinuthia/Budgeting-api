class CreateRevenueSources < ActiveRecord::Migration[7.0]
  def change
    create_table :revenue_sources do |t|
      t.string :name, unique: true

      t.timestamps

    end
  end
end
