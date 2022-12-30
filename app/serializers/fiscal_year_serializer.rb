class FiscalYearSerializer < ActiveModel::Serializer
  has_many :county_budgets
  attributes :id, :date_from, :date_to, :name
end
