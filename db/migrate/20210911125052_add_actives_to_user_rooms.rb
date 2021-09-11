class AddActivesToUserRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :user_rooms, :active, :boolean, default: true, null: false
  end
end
