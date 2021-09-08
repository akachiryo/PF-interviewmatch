class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

 def after_sign_out_path_for(resource)

    root_path(resource)
  end



private

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        flash[:notice] = "adminログインしました"
        users_rooms_path
      when User
        flash[:notice] = "ログインしました"
        users_rooms_path
    end
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end

end
