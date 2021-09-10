class Users::DmmessagesController < ApplicationController

  before_action :authenticate_user!

def create
    dmmessage = Dmmessage.new(dmmessage_params)
    dmmessage.save(dmmessage_params)

    # 送信相手　定義
    user_id = Entry.where(dmroom_id: dmmessage.dmroom_id).where.not(user_id: current_user).pluck("user_id").slice(0)
    user = User.find(user_id)
    Dmmessage.create_notification_dmmessage(current_user, user, dmmessage)
     redirect_to users_dmroom_path(dmmessage.dmroom_id)

end

private
def dmmessage_params
    params.require(:dmmessage).permit(:user_id, :dmroom_id, :content)
end

end


