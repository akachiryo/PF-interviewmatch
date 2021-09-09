class Users::DmroomsController < ApplicationController

  before_action :authenticate_user!

  def create
    dmroom = Dmroom.create
    @user_id = params[:user_id]
    @entry_me = Entry.create(dmroom_id: dmroom.id, user_id: current_user.id)
    @entry_you = Entry.create(dmroom_id: dmroom.id, user_id: @user_id)
    redirect_to users_dmroom_path(dmroom.id)
  end

  def show
    @dmroom = Dmroom.find(params[:id])
    @dmmessages = @dmroom.dmmessages
    @dmmessage = Dmmessage.new
    @entries = @dmroom.entries
  end

end
