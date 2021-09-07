class Tag < ApplicationRecord
  has_many :trip_tags
  has_many :trips, through: :trip_tags
end
