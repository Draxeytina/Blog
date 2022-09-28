class LikesController < ApplicationController
  def create
    respond_to do |format|
      format.html do
        @post = Post.find(params[:id])
        @user = current_user
        if post_liked?
          flash[:alert] = 'Post already liked'
          redirect_to user_post_path(@user, @post)
        else
          like = Like.new(author: @user, post: @post)
          like.save
          redirect_to user_post_path(@user, @post)
          flash[:success] = 'Post liked!'
        end
      end
    end
  end

  def post_liked?
    Like.where(author: @user, post: @post).exists?
  end
end
