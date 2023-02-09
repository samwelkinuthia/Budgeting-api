class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :county
  has_many :projects
end
