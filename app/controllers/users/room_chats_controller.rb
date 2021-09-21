class Users::RoomChatsController < ApplicationController

  before_action :authenticate_user!

  def create
    room_chat = RoomChat.new(room_chat_params)
    room_id = params[:room_id]
    room_chat.user_id = current_user.id
    room_chat.room_id = room_id
    user_id = UserRoom.where(room_id: room_id).where.not(user_id: current_user.id).pluck("user_id").slice(0)
    user = User.find(user_id)
    if room_chat.save
      RoomChat.create_notification_room_chat(current_user, user, room_chat)
      redirect_to users_room_path(room_id)
    else
      @room = Room.find(room_id)
      render "users/rooms/show"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to  users_rooms_path
    else
      @room = Room.find(room_id)
      render "users/rooms/show"
    end
  end

  private

    def room_chat_params
      params.require(:room_chat).permit(:message)
    end

end
