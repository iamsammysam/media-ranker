class VotesController < ApplicationController
  # def index
  #   @votes = Vote.all
  # end
  
  # def show
  #   vote_id = params[:id]
  #   @vote = Vote.find_by(id: vote_id)
  
  #   if @vote.nil?
  #     redirect_to votes_path
  #     return 
  #   end   
  # end
  
  # def new
  #   @vote = Vote.new
  # end
  
  def create
    vote = Vote.create(
    # date: Date.today
    user_id: params[:user_id],
    work_id: params[:work_id]
    )
    
    if vote.id
      redirect_to work_path(params[:work_id])
      return
    else
      redirect_to root_path
      return
    end
  end
  
  private
  
  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end
end
