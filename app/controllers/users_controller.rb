class UsersController < ApplicationController
  
  def index
    @users = User.all  
  end
  
  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    
    if @user.nil?
      # redirect_to works_path
      return 
    end   
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(vote_params) 
    if @user.save 
      # redirect_to work_path(@work.id)
      return
    else
      render :new
      return
    end
  end
  
  private
  
  def user_params
    return params.require(:user).permit(:name)
  end
end
