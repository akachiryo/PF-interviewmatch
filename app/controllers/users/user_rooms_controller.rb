class Users::UserRoomsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    # UserRoom.where(user_id: current_user.id, active: true).blank? &&
    if UserRoom.where(room_id: room.id, user_id: current_user.id).blank?
      user_room = UserRoom.new
      user_room.user_id = params[:user_id]
      user_room.room_id = params[:room_id]
      user_room.save
      # 入室通知
      user_id = UserRoom.where(room_id: params[:room_id]).where.not(user_id: current_user.id).pluck('user_id').slice(0)
      user_room_id = UserRoom.where(room_id: params[:room_id]).pluck('id').slice(0)
      user = User.find(user_id)
      user_room = UserRoom.find(user_room_id)
      UserRoom.create_notification_user_room(current_user, user, user_room)
      redirect_to users_room_path(user_room.room_id)
    else
      redirect_to users_room_path(params[:room_id])
    end
  end

  def update
    room_id = params[:room_id]
    @room = Room.find(room_id)
    user_room = UserRoom.where(room_id: room_id, user_id: current_user.id, active: true)
    user_room.update(active: false)
    @room.update(active: false) if UserRoom.where(room_id: @room.id, active: false).count == 2
    redirect_to users_rooms_path
  end
end
