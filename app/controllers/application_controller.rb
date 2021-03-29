class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 
  # def after_sign_in_path_for(resource)
  #  user_path
  # end
  # def after_sign_up_path_for(resource)
  #  user_path
  # end
  # def after_sign_out_path_for(resource_or_scope)
  #  new_user_session_path
  # end
  
  # def after_sign_in_path_for(resource)
  #   user_path(resource)
  # end
  
  def after_sign_in_path_for(resource)
      notices_path(resource)
  end

  def configure_permitted_parameters
    # sign_inのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_in, keys:[:group_key])
    # sign_upのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys:[:group_key, :name])
    #account_updateのときに、group_keyも許可する
      devise_parameter_sanitizer.permit(:account_update, keys:[:group_key])
  end
end
