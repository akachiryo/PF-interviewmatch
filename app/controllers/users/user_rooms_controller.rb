class Users::UserRoomsController < ApplicationController
  def create
    user_room = UserRoom.new
    user_room.user_id = params[:user_id]
    user_room.room_id = params[:room_id]
    user_room.save
    redirect_to users_room_path(user_room.room_id)
  end
end