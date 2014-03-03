class SiteController < ApplicationController
  def index
    @user = current_user
  end
  
  def login
    #@user = User.new
  end
  
  def logout
    # "Delete" a login, aka "log the user out"
    
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
    
  end
  
  def login_post
    if user = User.find_by(username: params[:username]).try(:authenticate, params[:password])  #user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
    else
    
      redirect_to :login
    end
  end
  
end
