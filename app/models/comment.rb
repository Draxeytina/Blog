class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author , class_name: "User"

  after_save :comment_counter

  private

  def comment_counter
    post.increment!(:comments_counter)
  end
end
