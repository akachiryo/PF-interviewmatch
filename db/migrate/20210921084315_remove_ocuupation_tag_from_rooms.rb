class RemoveOcuupationTagFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :ocuupation_tag_id, :integer
  end
end
