class CreateRoomChats < ActiveRecord::Migration[5.2]
  def change
    create_table :room_chats do |t|
      t.integer :user_id, null: false
      t.integer :room_id, null: false
      t.string :message

      t.timestamps
    end
  end
end
