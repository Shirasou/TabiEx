class Tag < ApplicationRecord
  has_many :trip_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :trips, through: :trip_tags
end
