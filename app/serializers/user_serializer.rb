class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :roles, :uid
end
