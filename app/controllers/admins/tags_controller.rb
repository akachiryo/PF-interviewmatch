class Admins::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.joins(:room_tags).group(:tag_id).order('count(tag_id) desc').page(params[:page]).per(50)
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = 'タグ名を更新しました'
      redirect_to admins_tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      redirect_to admins_tags_path
    else
      render :inndex
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
