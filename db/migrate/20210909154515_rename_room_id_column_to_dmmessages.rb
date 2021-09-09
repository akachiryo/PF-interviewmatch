class RenameRoomIdColumnToDmmessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :dmmessages, :room_id, :dmroom_id
  end
end
