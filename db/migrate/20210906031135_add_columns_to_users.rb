class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :image_id, :integer
    add_column :users, :introduction, :text
    add_column :users, :is_deleted, :boolean, default: true, null: false
  end
end
