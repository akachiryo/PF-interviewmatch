class Admins::OcuupationTagsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @ocuupation_tag = OcuupationTag.new
    @ocuupation_tags = OcuupationTag.all
  end

  def edit
    @ocuupation_tag = OcuupationTag.find(params[:id])
  end

  def create
    ocuupation_tag = OcuupationTag.new(ocuupation_tag_params)
    if ocuupation_tag.save
      redirect_to admins_ocuupation_tags_path
    else
      render :index
    end
  end

  def update
    ocuupation_tag = OcuupationTag.find(params[:id])
    if ocuupation_tag.update(ocuupation_tag_params)
      redirect_to admins_ocuupation_tags_path
    else
      render :edit
    end
  end

  private
    def ocuupation_tag_params
      params.require(:ocuupation_tag).permit(:name)
    end
end
