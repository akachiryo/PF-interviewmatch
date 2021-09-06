class Users::RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @rooms = Room.all
    @time_tags = TimeTag.all
    @ocuupation_tags = OcuupationTag.all
  end
  
  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
    @time_tags = TimeTag.all
    @ocuupation_tags = OcuupationTag.all
  end
  


  def create
    room = Room.new(room_params)
    room.user_id = current_user.id
    if room.save
      redirect_to users_rooms_path
    else
      @room = Room.new
      render :new
    end
  end

  private
    def room_params
      params.require(:room).permit(:user_id, :time_tag_id, :ocuupation_tag_id, :title, :content)
    end
end
