class RenameMessageIdColumnToNotification < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :message_id, :room_chat_id
  end
end
