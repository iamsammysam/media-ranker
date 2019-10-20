class VotesController < ApplicationController  
  def create
    if current_user.nil?
      flash[:warning] = "You must be logged in to vote."
      return
    end 
    
    if vote_check? 
      @work = Work.find_by(id: params[:work_id])
      
      vote = Vote.create(
      user_id: current_user.id,
      work_id: params[:work_id]
      )
      
      vote.id
      flash[:success] = "Your vote was successfully accepted!"
      redirect_to works_path
      return
      
    else
      flash[:warning] = "Can't upvote. You already voted for this work."
      redirect_to works_path
      return
    end
  end
  
  def vote_check?
    @work = Work.find_by(id: params[:work_id])
    if @work.votes.find_by(user_id: current_user.id)
      return false
    end 
  end 
  
  def destroy
    vote_id = params[:id]
    @vote = Vote.find_by(id: vote_id)
    
    if @vote.nil?
      head :not_found
      return
    end
    
    if @vote.destroy
      flash[:success] = "Work successfully deleted."
      redirect_to works_path
      return
    else
      flash[:warning] = "Can't delete work."
      redirect_to works_path
    end 
  end
  
  private
  
  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end
end 
