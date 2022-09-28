class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :update_counter

  def three_recent_posts
    Post.where(author: self).order(updated_at: :desc).limit(3)
  end

  def all_user_posts
    Post.where(author: self)
  end

  def update_counter
    self.posts_counter ||= 0
  end
end
