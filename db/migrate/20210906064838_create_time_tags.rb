class CreateTimeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tags do |t|
      t.string :span, null: false
      t.timestamps
    end
  end
end
