class Post < ApplicationRecord
  belongs_to :author , class_name: "User"
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  def update_posts_counter
    if author.posts_counter
      author.posts_counter += 1
    else 
      author.posts_counter = 1
    end
    author.save
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
