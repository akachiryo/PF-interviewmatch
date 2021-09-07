class ChangeDataMessageToRoomChat < ActiveRecord::Migration[5.2]
  def change
    change_column :room_chats, :message, :text
  end
end
