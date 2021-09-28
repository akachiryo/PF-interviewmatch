class Users::TagsController < ApplicationController
  before_action :authenticate_user!

  def search
    @keyword = params[:keyword]
    @tags = Tag.search(params[:keyword])
    @tags.each do |tag|
      @rooms = tag.rooms.includes([:tags], [:user]).page(params[:page]).per(10).order(created_at: :desc)
    end
    render  "users/rooms/index"
  end

  def mysearch
    @rooms = Room.includes([:tags], [:user]).where(user_id: current_user.id).page(params[:page]).per(10).order(created_at: :desc)
    render  "users/rooms/index"
  end
end
