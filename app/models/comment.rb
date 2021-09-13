class Comment < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :notifications, dependent: :destroy
end
