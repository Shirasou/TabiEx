class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trip_way, optional: :true
  belongs_to :category, optional: :true
  has_many :trip_tags, dependent: :destroy
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

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(name: new)
      self.tags << new_tag
    end
  end

  def self.search_for(content,method)
    if method == 'perfect'
      Trip.where(title: content)
    elsif method == 'forward'
      Trip.where('title LIKE ?', content + '%' )
    elsif method == 'backward'
      Trip.where('title LIKE ?', '%' + content )
    else
      Trip.where('title LIKE ?', '%' + content + '%' )
    end
  end
end
