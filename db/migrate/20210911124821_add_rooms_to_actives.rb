class AddRoomsToActives < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :active, :boolean, default: true, null: false
  end
end
