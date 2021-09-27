class TripTag < ApplicationRecord
  belongs_to :trip
  belongs_to :tag
end
