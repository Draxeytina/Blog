class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author , class_name: "User"

  after_save :comment_counter

  def comment_counter
    if post.comments_counter
      post.comments_counter += 1
    else 
      post.comments_counter = 1
    end
    post.save
  end
end
