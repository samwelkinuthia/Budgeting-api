class CountySerializer < ActiveModel::Serializer
  # has_many :county_budgets
  attributes :name, :code
  has_many :departments
end
