class HomesController < ApplicationController
  def top
    @rooms = Room.page(params[:page]).per(10)
    @time_tags = TimeTag.all
    @ocuupation_tags = OcuupationTag.all
  end

  def about

  end
end