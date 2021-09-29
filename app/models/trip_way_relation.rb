class TripWayRelation < ApplicationRecord
  belongs_to :trip
  belongs_to :trip_way, dependent: :destroy

end
