class UsersController < ApplicationController
  def index
    @users = User.all  
  end
  
  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    
    if @user.nil?
      redirect_to users_path
      return 
    end
  end
  
  def login_form
    @user = User.new
  end 
  
  def login
    name = params[:user][:name]
    user = User.find_by(name: name)
    
    if @user
      session[:user_id] = user.id
      # flash[:success] = "Successfully logged in as returning user #{username}"
    else 
      user = User.new(name: name)
      user.save
      session[:user_id] = user.id
      # flash[:success] = "Successfully logged in as new user #{username}"
    end
    
    redirect_to root_path
  end 
  
  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private
  
  def user_params
    return params.require(:user).permit(:name)
  end
end
