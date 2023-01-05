class AddProejctCounterCacheToDepartment < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :projects_count, :integer
  end
end
