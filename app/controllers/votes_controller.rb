class VotesController < ApplicationController  
  def create
    if current_user.nil?
      flash[:warning] = "You must be logged in to vote."
      return
    end 
    
    if vote_check? 
      @work = Work.find_by(id: params[:id])
      
      vote = Vote.create(
      user_id: current_user.id,
      work_id: params[:work_id]
      )
      
      vote.id
      flash[:success] = "You just voted!"
      redirect_to work_path(params[:work_id])
      return
      
    else
      flash[:warning] = "You already voted for this work."
      redirect_to work_path(params[:work_id])
      return
    end
  end
  
  def vote_check?
    current_user.votes.each do |vote|
      if vote.work_id == params[:work_id]
        return false
      end 
    end 
  end 
  
  private
  
  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end
end
