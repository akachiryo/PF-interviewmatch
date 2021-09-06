class ApplicationController < ActionController::Base


private

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        flash[:notice] = "ログインしました"
        users_rooms_path
      when User
        flash[:notice] = "adminログインしました"
        users_rooms_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
      when Admin
        flash[:notice] = "adminログアウトしました"
        users_rooms_path
      when User
        flash[:notice] = "ログアウトしました"
        root_path
    end
  end

end
