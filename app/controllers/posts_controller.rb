class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comments = @post.comments.limit(5)
  end

  def new
    @user = current_user
    @newPost = Post.new
  end

end
