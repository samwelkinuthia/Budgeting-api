class ApplicationController < ActionController::API
        before_action :configure_permitted_parameters, if: :devise_controller?
        rescue_from ActionController::Redirecting::UnsafeRedirectError do
                redirect_to "http://localhost:3001", allow_other_host: true
        end
        include DeviseTokenAuth::Concerns::SetUserByToken

        protected

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
        end
end
