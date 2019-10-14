class UserCommentsController < ApplicationController 
  def new 
    @user_comment = UserComment.new 
    render :new 
  end 

  def create 
    @user_comment = UserComment.new(user_comment_params)

    if @user_comment.save
      flash[:notice] = "Comment Added!"
      redirect_to user_url(@user_comment.user_id)
    else
      flash.now
    end
  end 

  private 
  def user_comment_params 
    params.require(:user_comment).permit(:body, :user_id)
  end 
end 