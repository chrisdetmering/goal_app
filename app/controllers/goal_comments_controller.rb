class GoalCommentController < ApplicationController 
  def new 
    @goal_comment = GoalComment.new 
  end 

  def create 
    @goal_comment = GoalComment.new (goal_comment_params)
    @goal_comment.goal_id = current_user.id 
    
    if @goal_comment.save
      flash[:notice] = "Comment Added!"
      redirect_to user_url(@goal_comment.goal_id)
    else
      flash.now[:errors] = @goal_comment.errors.full_messages 

      redirect_to user_url(@goal_comment.goal_id)
    end
  end 

  private 
  def goal_comment_params 
    params.require(:goal_comment).permit(:body)
  end 
end 