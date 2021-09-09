class Users::DmmessagesController < ApplicationController

  before_action :authenticate_user!

def create
    dmmessage = Dmmessage.new(dmmessage_params)
    dmmessage.save!(dmmessage_params)
    redirect_to users_dmroom_path(dmmessage.dmroom_id)

end

private
def dmmessage_params
    params.require(:dmmessage).permit(:user_id, :dmroom_id, :content)
end

end
