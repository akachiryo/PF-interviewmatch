class Users::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.where(user_id: current_user.id)
    @schedule = Schedule.new
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    Schedule.create(schedule_params)
    redirect_to users_schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to  users_schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to users_schedules_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :title, :content, :start_time)
  end

end
