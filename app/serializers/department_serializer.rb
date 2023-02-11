class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :totalBudget, :developmentBudget, :recurrentBudget, :pendingBills, :projects
  has_one :county
  has_many :projects
end
