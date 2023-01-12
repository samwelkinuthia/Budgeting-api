class AddProjectCounterToCounty < ActiveRecord::Migration[7.0]
  def change
    add_column :counties, :projects_count, :integer
  end
end
