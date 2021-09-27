class CreateTripLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_likes do |t|
      t.integer :trip_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
