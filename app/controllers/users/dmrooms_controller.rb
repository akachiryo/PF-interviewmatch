class Users::DmroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dmroom = Dmroom.find(params[:id])
    @dmmessages = @dmroom.dmmessages.includes([:user]).limit(14).order('id DESC').reverse
    @dmmessage = Dmmessage.new
    @entries = @dmroom.entries
    @entries.each do |entry|
      User.find(entry.user_id)
      @user = User.find(entry.user_id) if User.find(entry.user_id) != current_user
    end
  end

  def create
    @user_id = params[:user_id]
    dmroom_ids = Entry.where(user_id: current_user.id).pluck('dmroom_id')
    dmroom_ids.each do |dmroom_id|
      entry = Entry.where(dmroom_id: dmroom_id, user_id: @user_id)
      @entry = entry if entry.present?
    end
    if @entry.present?
      redirect_to users_dmroom_path(@entry.pluck('dmroom_id').slice(0))
    else
      dmroom = Dmroom.create
      @entry_me = Entry.create(dmroom_id: dmroom.id, user_id: current_user.id)
      @entry_you = Entry.create(dmroom_id: dmroom.id, user_id: @user_id)
      redirect_to users_dmroom_path(dmroom.id)
    end
  end
end
