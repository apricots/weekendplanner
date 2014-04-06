class CommentsController < ApplicationController

  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.creator = current_user
    @comment.post = @post
    @comments = Comment.where("post_id = #{params[:post_id]}")

    if @comment.save
      flash[:notice] = "Comment submitted."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end