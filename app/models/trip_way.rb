class TripWay < ApplicationRecord
  belongs_to :user
  has_many :trips, dependent: :destroy

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
