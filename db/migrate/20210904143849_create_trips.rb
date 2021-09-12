class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id, null: false
      t.integer :category_id
      t.text :title, null: false
      t.float :evaluation, null: false, default: 0
      t.datetime :date_time, null: false
      t.text :description, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
