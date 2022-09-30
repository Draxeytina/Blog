class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_parameters

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comments = Comment.includes(:post).where(id: params[:user_id])
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

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'Post deleted.'
    redirect_to user_posts_path
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
