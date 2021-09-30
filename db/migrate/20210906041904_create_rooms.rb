class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id, null: false
      t.integer :time_tag_id, null: false
      t.integer :occupation_tag_id, null: false
      t.string :name, null: false
      t.string :content, default: '記述がありません'
      t.timestamps
    end
  end
end
