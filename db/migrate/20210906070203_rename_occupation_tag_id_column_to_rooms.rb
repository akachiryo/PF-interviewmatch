class RenameOccupationTagIdColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :occupation_tag_id, :ocuupation_tag_id
  end
end
