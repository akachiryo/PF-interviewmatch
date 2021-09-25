class HomesController < ApplicationController
  def top
    @rooms = Room.includes([:tags], [:user]).page(params[:page]).per(10).order(created_at: :desc)
    @tags = Tag.joins(:room_tags).group(:tag_id).order('count(tag_id) desc').limit(10)
  end

  def about
  end
end