class AddActivesToUserRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :user_rooms, :active, :boolean
  end
end
