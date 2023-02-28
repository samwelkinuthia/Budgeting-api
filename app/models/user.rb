# frozen_string_literal: true

class User < ActiveRecord::Base
  after_validation :update_params
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  def update_params
    return unless user_type_id.nil?

    update(user_type_id: 1, county_id: nil)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :size, inclusion: { in: %w(small medium large),
  #                               message: "%{value} is not a valid size" }
end
