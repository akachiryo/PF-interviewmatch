class Users::TagsController < ApplicationController
  before_action :authenticate_user!

  def search
    @keyword = params[:keyword]
    @tags = Tag.search(params[:keyword])
    @tags.each do |tag|
      @rooms = tag.rooms.page(params[:page]).per(10).order(created_at: :desc)
    end

    render  "users/rooms/index"
  end

end