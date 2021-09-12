class Users::RoomChatsController < ApplicationController

  def create
    room_chat = RoomChat.new(room_chat_params)
    room_id = params[:room_id]
    room_chat.user_id = current_user.id
    room_chat.room_id = room_id
    if room_chat.save
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
