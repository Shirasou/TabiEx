class CreateTripTags < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_tags do |t|
      t.integer :tag_id, null: false
      t.integer :trip_id, null: false

      t.timestamps
    end
  end
end
