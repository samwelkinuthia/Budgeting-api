class AddCountyIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :county, null: true, foreign_key: true
    add_reference :users, :department, null: true, foreign_key: true
    add_reference :users, :user_type, null: true, foreign_key: true
  end
end
