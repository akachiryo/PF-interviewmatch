class HomesController < ApplicationController
  def top
    @rooms = Room.page(params[:page]).per(10)
  end
end