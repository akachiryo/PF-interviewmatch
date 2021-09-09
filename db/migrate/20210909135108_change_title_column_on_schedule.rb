class ChangeTitleColumnOnSchedule < ActiveRecord::Migration[5.2]
  def change
    change_column_null :schedules, :title, false
  end
end
