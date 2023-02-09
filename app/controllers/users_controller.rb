class UsersController < ApplicationController
  before_action :set_user,  only: %i[ show update destroy ]
  def index
    @users = User.all
    json_response(@users, :ok,  [], true, "#{@users.size} records found")
  end

  def show
    json_response(@user, :ok,  [], true, "User found")
  end

  def update
  end

  def types
    json_response(UserType.all, :ok,  [], true, "User types found")
  end

  protected

  def set_user
    @user = User.find(params[:id])
  end
  def revenue_source_params
    params.require(:user).permit(:email)
  end
end
