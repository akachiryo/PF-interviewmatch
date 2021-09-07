class Users::RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @rooms = Room.page(params[:page]).per(10)
    @time_tags = TimeTag.all
    @ocuupation_tags = OcuupationTag.all
  end

  def show
    @room = Room.find(params[:id])
    @room_chat = RoomChat.new
    @room_chats = RoomChat.where(room_id: @room.id).reverse
  end

  def new
    @room = Room.new
    @time_tags = TimeTag.all
    @ocuupation_tags = OcuupationTag.all
  end

  def search
    @time_tag_id = params[:time_tag_id]
    @ocuupation_tag_id = params[:ocuupation_tag_id]
    if @time_tag_id.present?
      @rooms = TimeTag.find(@time_tag_id).rooms
      @rooms = @rooms.page(params[:page]).per(10)
    elsif @ocuupation_tag_id.present?
      @rooms = OcuupationTag.find(@ocuupation_tag_id).rooms
      @rooms = @rooms.page(params[:page]).per(10)
    end
    @time_tags = TimeTag.all
    @ocuupation_tags = OcuupationTag.all
  end

  def create

    room = Room.new(room_params)
    room.user_id = current_user.id
    if room.save
      user_room = UserRoom.new
      user_room.user_id = room.user_id
      user_room.room_id = room.id
      user_room.save
      redirect_to users_rooms_path
    else
      @room = Room.new
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to users_rooms_path
    else
      render :show
    end
  end

  private

    def room_params
      params.require(:room).permit(:user_id, :time_tag_id, :ocuupation_tag_id, :title, :content)
    end

end
