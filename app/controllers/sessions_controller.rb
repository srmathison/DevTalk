class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def destroy
      session[:user_id] = nil
      flash[:alert]  = "susscessfully logged out"
      redirect_to root_path
    end
    
    def create
      # passing in username and password
      # setting to instance variable
      username = params[:username]
      password = params[:password]

      # using the params username we should be able to find with this 
      # where will always return an array...must state .first 
      # want a single user, not an array within an array
      @user = User.where(username: username).first
    
      # if they entered wrong username
      if @user.nil?
        flash[:alert] = "Incorrect credientials"
        # redirect_to...find a path to redirect to OR
          redirect_to root_path

      
      else
        # success password case
        if @user.password == password
          session[:user_id] = @user.id
          flash[:alert] = "Welcome!"
          redirect_to root_path

        else
          # wrong password case
          flash[:alert] = "Incorrect credientials"
          redirect_to root_path
      end
    end
  end

end
