module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def render_create_error
      #   binding.pry
      render json: { success: false, message: @resource.errors.full_messages.join('') }, status: :unprocessable_entity
      #   render json: @resource
    end

    def render_create_success
      render json: { success: true, message: 'User successfully created', data: @resource },
             status: :ok
    end
  end
end
