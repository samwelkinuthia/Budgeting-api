class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :county
end
