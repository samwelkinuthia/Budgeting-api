class UsersController < ApplicationController
  before_action :set_user,  only: %i[ show update destroy ]
  def index
    @users = User.all
    json_response(ActiveModelSerializers::SerializableResource.new(@users, each_serializer: UserSerializer), :ok,  [], true, "#{@users.count} users found")
  end

  def show
    json_response(@user, :ok,  [], true, "User found", ['roles'])
  end

  def update
  end

  protected

  def set_user
    @user = User.find(params[:id])
  end
  def revenue_source_params
    params.require(:user).permit(:email)
  end
end
