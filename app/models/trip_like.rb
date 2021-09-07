class TripLike < ApplicationRecord
  has_many :notifications, dependent: :destroy
end
