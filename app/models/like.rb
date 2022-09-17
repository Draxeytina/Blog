class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  after_save :update_likes_counter

  def update_likes_counter
    if post.likes_counter
      post.likes += 1
    else 
      post.likes = 1
    end
    post.save
  end
end
