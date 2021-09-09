class Message < ApplicationRecord
  validates :message, presence: true
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
end
