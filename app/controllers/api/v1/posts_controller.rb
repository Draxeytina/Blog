class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    posts = Post.where(author_id: params[:user_id])
    render json: { status: 'Success', message: 'Posts loaded successfully', data: posts }, status: :ok
  end

  def show
    post = Post.where(id: params[:id])
    render json: { status: 'Success', message: 'Post loaded successfully', data: post }, status: :ok
  end
end