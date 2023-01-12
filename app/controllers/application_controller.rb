class ApplicationController < ActionController::API
        include Response, CsvImport
        before_action :configure_permitted_parameters, if: :devise_controller?
        rescue_from ActionController::Redirecting::UnsafeRedirectError do
                redirect_to "http://localhost:3001", allow_other_host: true
        end
        rescue_from ActiveRecord::RecordNotUnique do |exception|
                render json: { message: exception.message, success:false}, status: :unprocessable_entity
        end
        rescue_from ActiveRecord::RecordInvalid do |exception|
                render json: { message: exception.message, success:false}, status: :unprocessable_entity
        end

        include DeviseTokenAuth::Concerns::SetUserByToken

        protected

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :county_id, :department_id, :user_type_id])
        end
end
