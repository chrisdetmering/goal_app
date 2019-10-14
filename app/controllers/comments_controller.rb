class CommentsController < ApplicationController 
  def new 
    @comment = Comment.new
  end 

  def create 
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment Added!"
      redirect_to request.referrer
    else
      flash.now[:errors] = @comment.errors.full_messages 
      redirect_to request.referrer
    end
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end 
end 