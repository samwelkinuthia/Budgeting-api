class CountySerializer < ActiveModel::Serializer
  has_many :county_budgets
  attributes :id, :name, :code
end
