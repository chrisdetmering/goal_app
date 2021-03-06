class SessionsController < ApplicationController 
  #loging in a current user 
  
  def new 
    render :new
  end 

  def create 
      user = User.find_by_credentials( 
        params[:user][:email], 
        params[:user][:password]
      )

    if user.nil? 
      flash.now[:errors] = user.errors.full_messages
      render new_session_url

    else 
      log_in(user)
      redirect_to user_url(user)

    end 
    
  end 

  def destroy 
    log_out
    redirect_to users_url
  end 
end 