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

  def create
    @post = Post.new(post_parameters)
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
