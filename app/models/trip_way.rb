class TripWay < ApplicationRecord
  belongs_to :user
  has_many :trip_way_relations, dependent: :destroy
  accepts_nested_attributes_for :trip_way_relations, allow_destroy: true

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def self.search_for(content,method)
    if method == 'perfect'
      TripWay.where(title: content)
    elsif method == 'forward'
      TripWay.where('title LIKE ?', content + '%' )
    elsif method == 'backward'
      TripWay.where('title LIKE ?', '%' + content )
    else
      TripWay.where('title LIKE ?', '%' + content + '%' )
    end
  end
  
  def old_image
    images.order(id: 'ASC').first
  end
end
