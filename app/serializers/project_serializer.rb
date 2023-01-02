class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ward, :location, :status, :budgetAmount
  has_one :department
  has_one :fiscal_year
end
