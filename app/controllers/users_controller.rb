class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :image, :introduction)
    end
end
