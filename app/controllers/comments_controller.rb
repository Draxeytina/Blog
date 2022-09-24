class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = Comment.new(author: current_user, post: @post, text: params[:text])
    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user, @post)
        end
      end
    end
  end

  private

  def strong_params
    params.require(:comment).permit(:title, :text)
  end
end
