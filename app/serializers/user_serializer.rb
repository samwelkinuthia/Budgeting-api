class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :uid

  def role
    # x = []
    # object.roles.each do |role|
    #   x.push(role.name)
    # end
    # x
    object.roles[0].name
  end
end


