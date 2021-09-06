class Admins::TimeTagsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @time_tag = TimeTag.new
    @time_tags = TimeTag.all
  end

  def edit
    @time_tag = TimeTag.find(params[:id])
  end

  def create
    time_tag = TimeTag.new(time_tag_params)
    if time_tag.save
      redirect_to admins_time_tags_path
    else
      render :index
    end
  end

  def update
    time_tag = TimeTag.find(params[:id])
    if time_tag.update(time_tag_params)
      redirect_to admins_time_tags_path
    else
      render :edit
    end
  end

  private
    def time_tag_params
      params.require(:time_tag).permit(:span)
    end
end
