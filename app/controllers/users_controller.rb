class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    if params[:user][:password] == params[:password_confirmation]
      @user = User.create user_params
      session[:user_id] = @user.user_id
      redirect_to posts_path
    else
      flash[:alert] = "Incorrect password"
      redirect_to new_post_path
    end
  end
    
    private

    def user_params
      params.require(:user).permit(:username, :password, :about)
    end
end
