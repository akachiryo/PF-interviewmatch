class AddUserIdToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :user_id, :integer
    change_column :schedules, :user_id, :integer, null: false
  end
end
