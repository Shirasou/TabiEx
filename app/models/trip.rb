class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: :true
  has_many :trip_tags, dependent: :destroy
  has_many :tags, through: :trip_tags
  has_many :comments, dependent: :destroy
  has_many :trip_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :trip_way_relations, dependent: :destroy
  has_many_attached :images

  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :date, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :city, presence: true
  validates :images, presence: true
  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def trip_liked_by?(user)
    trip_likes.where(user_id: user.id).exists?
  end

  # タグ機能
  def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(name: new)
      tags << new_tag
    end
  end

  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Trip.where(title: content)
    elsif method == 'forward'
      Trip.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Trip.where('title LIKE ?', '%' + content)
    else
      Trip.where('title LIKE ?', '%' + content + '%')
    end
  end

  # 通知機能
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      trip_id: id,
      visited_id: user_id,
      action: "trip_like"
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(trip_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # 複数回通知許可
    notification = current_user.active_notifications.new(
      trip_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントは、通知済み設定
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def old_image
    images.order(id: 'ASC').first
  end
end
