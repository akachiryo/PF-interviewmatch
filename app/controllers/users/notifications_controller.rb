class Users::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(visited_id: current_user.id).page(params[:page]).per(6)
    current_user.passive_notifications.page(params[:page]).per(6)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end