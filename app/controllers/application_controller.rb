class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   posts_path
  # end

  # def after_sign_out_path_for(resource)
  #   admin_root_path
  # end
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [ :encrypted_password,:name ]) 
      end
end
