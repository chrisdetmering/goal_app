class GoalsController < ApplicationController
  
  def index 
    @goals = Goal.all 
    render :index
  end 

  def new 
    @goal = Goal.new 
    render :new 
  end 

  def create 
    @goal = Goal.new(goals_params)
    @goal.user_id = current_user.id 

    if @goal.save
      
      redirect_to goal_url(@goal)
    else
      
      flash.now[:errors] = @goal.errors.full_messages
      render :new 
    end
  end

  def show 
    @goal = Goal.find(params[:id])
    render :show
  end 

  def edit 
    @goal = Goal.find(params[:id])

    render :edit
  end 

  def update 
    goal = Goal.update(params[:id], goals_params)
     
    if goal.save!
      flash[:notice] = "Goal Updated!"
      redirect_to request.referrer
    else 
      flash.now[:errors] = goal.errors.full_messages
      render :edit
    end 
  end 

  def destroy 
    @goal = Goal.find(params[:id])

    if @goal.destroy
      flash[:notice] = "Goal Deleted!"
      redirect_to user_url(@goal.user_id)
    else 
      flash.now[:errors] = goal.errors.full_messages
      render :edit
    end 
  end 

  private

  def goals_params 
    params.require(:goal).permit(:title, :description, :private?, :completed)
  end 
end 