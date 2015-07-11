class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def show
   if params[:id]
     @user = User.find(params[:id])
   else
     redirect_to users_path unless current_user.present?
     @user = current_user
   end
 end

  def index
    @users = User.all
  end

  def create
      @user = User.new(user_params)
      if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
      # redirect_to user_path(@user.id)
    else
      flash[:alert] = "Incorrect password"
      redirect_to root_path
    end

  end

  def update

  end
    
    private

    def user_params
      params.require(:user).permit(:username, :password, :about, :fname, :email)
    end


end
