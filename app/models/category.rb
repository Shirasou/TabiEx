class Category < ApplicationRecord
  has_many :trips
  has_one_attached :image
end
