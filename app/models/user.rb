# frozen_string_literal: true

class User < ActiveRecord::Base
  rolify
  resourcify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :size, inclusion: { in: %w(small medium large),
  #                               message: "%{value} is not a valid size" }

  def assign_default_role
    # binding.pry
    self.add_role(:SystemAdmin, User) if self.roles.blank?
    # self.add_role(:system_admin) if self.roles.blank?
  end
end

