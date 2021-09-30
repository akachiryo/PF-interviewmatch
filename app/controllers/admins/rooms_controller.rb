class Admins::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = Room.includes([:tags], [:user]).page(params[:page]).per(10).order(created_at: :desc)
    @tags = Tag.joins(:room_tags).group(:tag_id).order('count(tag_id) desc')
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to admins_rooms_path
    else
      render :index
    end
  end
end
