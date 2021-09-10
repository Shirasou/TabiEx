class CreateTripWays < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_ways do |t|
      t.integer :user_id, null: false
      t.integer :trip_id, null: false
      t.string :title, null: false
      t.float :evaluation, null: false, default: 0
      t.text :description, null: false
      t.date :start_date, null: false
      t.date :finish_date, null: false
      t.integer :number_of_people, null: false

      t.timestamps
    end
  end
end
