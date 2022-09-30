class Post < ApplicationRecord
  belongs_to :author , class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :update_counters

  after_save :increment_posts_counter
  after_destroy :decrement_posts_counter

  def five_recent_comments
    Comment.where(post: self).limit(5)
  end

  def update_counters
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end
