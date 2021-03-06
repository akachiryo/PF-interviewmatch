class Users::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.includes([:tags], [:user]).page(params[:page]).per(10).order(created_at: :desc)
    @tags = Tag.joins(:room_tags).group(:tag_id).order('count(tag_id) desc')
  end

  def show
    @room = Room.find(params[:id])
    user_id = @room.user_id
    @user = User.find(user_id)
    @user_partoner_id = UserRoom.where(room_id: @room.id).where.not(user_id: current_user.id).pluck('user_id').slice(0)
    @user_partoner = User.find(@user_partoner_id) if @user_partoner_id.present?
    @room_chat = RoomChat.new
    @room_chats = RoomChat.where(room_id: @room.id).limit(14).order('id DESC').reverse
    @relationship = current_user.relationships.find_by(follow_id: @user.id)
  end

  def new
    @room = Room.new
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

  def finish
    @room_id = UserRoom.where(user_id: current_user.id,
                              active: false).order(updated_at: :desc).limit(1).pluck('room_id')
    @user_id = UserRoom.where(room_id: @room_id).where.not(user_id: current_user).pluck('user_id')
    @user_a = User.find(@user_id)
    @room_a = Room.find(@room_id)
    @user = User.find(@user_a.pluck('id').slice(0))
    @room = Room.find(@room_a.pluck('id').slice(0))
    @relationship = if current_user.following?(@user)
                      Relationship.where(user_id: current_user.id, follow_id: @user.id)
                    else
                      Relationship.new
                    end
    @room.update(active: false) if UserRoom.where(room_id: @room.id, active: false).count == 2
  end

  def create
    room = Room.new(room_params)
    room.user_id = current_user.id
    tag_list = params[:room][:name].gsub(/???/, ' ').strip.split('#').slice(1, 2)
    if room.save
      room.save_tag(tag_list)
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
    params.require(:room).permit(:user_id, :title, :content)
  end
end
