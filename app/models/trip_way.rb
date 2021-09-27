class TripWay < ApplicationRecord
  belongs_to :user
  has_many :trip_way_relations, dependent: :destroy
  has_many :trips, through: :trip_way_relations
  accepts_nested_attributes_for :trip_way_relations, reject_if: :all_blank, allow_destroy: true

  validates :trip_ids, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :number_of_people, presence: true
  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      TripWay.where(title: content)
    elsif method == 'forward'
      TripWay.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      TripWay.where('title LIKE ?', '%' + content)
    else
      TripWay.where('title LIKE ?', '%' + content + '%')
    end
  end

  def old_image
    images.order(id: 'ASC').first
  end
end
