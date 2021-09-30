class RenameUserIdColumnToTagId < ActiveRecord::Migration[5.2]
  def change
    remove_column :room_tags, :user_id
    add_reference :room_tags, :tag, foreign_key: true
  end
end
