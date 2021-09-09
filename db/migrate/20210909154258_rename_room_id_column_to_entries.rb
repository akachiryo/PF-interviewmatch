class RenameRoomIdColumnToEntries < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :room_id, :dmroom_id
  end
end
