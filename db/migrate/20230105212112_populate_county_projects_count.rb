class PopulateCountyProjectsCount < ActiveRecord::Migration[7.0]
  def change
    County.all.each do |c|
      County.reset_counters(c.id, :projects_count)
    end
  end
end
