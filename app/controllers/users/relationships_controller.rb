class Users::RelationshipsController < ApplicationController

  def create
    relationship = Relationship.new
    relationship.user_id = current_user.id
    relationship.follow_id = params[:follow_id]

    if relationship.save
      flash[:success] = 'ユーザーをフォローしました'
      
      
      
      
      user_id = Entry.where(dmroom_id: dmmessage.dmroom_id).where.not(user_id: current_user).pluck("user_id").slice(0)
      user = User.find(user_id)
      Dmmessage.create_notification_dmmessage(current_user, user, dmmessage)
      
      
      if request.referer&.include?('finish')
        redirect_to users_rooms_finish_path
      else
        redirect_to user_path(relationship.follow_id)
      end
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to users_rooms_finish
    end
  end
  def destroy
   relationship = Relationship.find(params[:id])

    if relationship.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      if request.referer&.include?('finish')
        redirect_to users_rooms_finish_path
      else
        redirect_to user_path(relationship.follow_id)
      end
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @user
    end
  end

end
