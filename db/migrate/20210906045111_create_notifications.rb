class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :room_id
      t.integer :message_id
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :comment_id
      t.integer :trip_id
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
