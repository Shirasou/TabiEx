class CreateTripWayRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_way_relations do |t|
      t.integer :trip_id
      t.integer :trip_way_id

      t.timestamps
    end
  end
end
