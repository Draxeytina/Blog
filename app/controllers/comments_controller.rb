class CommentsController < ApplicationController
  def comment
    @post = Post.find(params[:id])
    p params
    @comment = Comment.new(author: current_user, post: @post, text: params[:text])
    @comment.save
    redirect_to user_post_path(current_user, @post)
  end
end
