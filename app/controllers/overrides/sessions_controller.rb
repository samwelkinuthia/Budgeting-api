module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController

    def create
      binding.pry
      if @resource
        render json: {
          data: @resource.as_json(methods: :calculate_operating_thetan)
        }
      else
        render json: {
          success: false,
          errors: ["Invalid login credentials"]
        }, status: 401
      end
    end
  end
end