class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ward, :location, :status, :budgetAmount, :fiscal_year
end
