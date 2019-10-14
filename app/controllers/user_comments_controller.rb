class UserCommentsController < ApplicationController 
  def new 
    @user_comment = UserComment.new 
  end 

  def create 
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.user_id = current_user.id 
    
    if @user_comment.save
      flash[:notice] = "Comment Added!"
      redirect_to user_url(@user_comment.user_id)
    else
      flash.now[:errors] = @user_comment.errors.full_messages 

      redirect_to user_url(@user_comment.user_id)
    end
  end 

  private 
  def user_comment_params 
    params.require(:user_comment).permit(:body)
  end 
end 