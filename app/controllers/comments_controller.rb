class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @user = @comment.user
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
