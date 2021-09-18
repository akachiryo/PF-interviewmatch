class Users::RelationshipsController < ApplicationController

  def create
    relationship = Relationship.new
    relationship.user_id = current_user.id
    relationship.follow_id = params[:follow_id]

    if relationship.save
      flash[:success] = 'ユーザーをフォローしました'
      user = User.find(relationship.follow_id)
      Relationship.create_notification_follow(current_user, user)
      if request.referer&.include?('finish')
        redirect_to users_rooms_finish_path
      elsif request.referer&.include?('room')
        redirect_to request.referer
      else
        redirect_to user_path(relationship.follow_id)
      end
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to users_rooms_finish_path
    end
  end

  def destroy
   relationship = Relationship.find(params[:id])

    if relationship.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      if request.referer&.include?('finish')
        redirect_to users_rooms_finish_path
      elsif request.referer&.include?('room')
        redirect_to request.referer
      else
        redirect_to user_path(relationship.follow_id)
      end
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to ser_path(relationship.follow_id)
    end
  end

end
