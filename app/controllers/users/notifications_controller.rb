class Users::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(visiter_id: current_user.id).page(params[:page]).per(20)
    # current_user.passive_notifications.page(params[:page]).per(20)
    # @notifications.where(checked: false).each do |notification|
      # notification.update_attributes(checked: true)
    # end
  end
end