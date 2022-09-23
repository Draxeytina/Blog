class LikesController < ApplicationController
  def like
    @post = Post.find(params[:id])
    @user = current_user
    like = Like.new(author: @user, post: @post)
    like.save
    redirect_to user_post_path(@user, @post)
  end
end
