class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trip_way, optional: :true
  belongs_to :category, optional: :true
  has_many :trip_tags
  has_many :tags, through: :trip_tags
  has_many :comments, dependent: :destroy
  has_many :trip_likes, dependent: :destroy
  has_many_attached :images

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  
  def trip_liked_by?(user)
    trip_likes.where(user_id: user.id).exists?
  end
end
