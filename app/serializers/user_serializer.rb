class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :county, :department, :user_type
end


