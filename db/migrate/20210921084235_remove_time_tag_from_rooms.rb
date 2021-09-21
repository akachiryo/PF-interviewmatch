class RemoveTimeTagFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :time_tag_id, :integer
  end
end
