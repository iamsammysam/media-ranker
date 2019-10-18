class VotesController < ApplicationController
  
  def index
    @votes = Vote.all  
    # @movies = Work.sort_by_category(movie)
    # @books = Work.sort_by_category("book")
    # @albums = Work.sort_by_category("album")
  end
  
  def show
    vote_id = params[:id]
    @vote = Vote.find_by(id: vote_id)
    
    if @vote.nil?
      # redirect_to works_path
      return 
    end   
  end
  
  def new
    @vote = Vote.new
  end
  
  def create
    @vote = Vote.new(vote_params) 
    if @vote.save 
      # redirect_to work_path(@work.id)
      return
    else
      render :new
      return
    end
  end
  
  def edit
    @vote = Vote.find_by(id: params[:id])
    
    if @vote.nil?
      # redirect_to works_path
      return
    end
  end
  
  def update
    @vote = Vote.find_by(id: params[:id])
    if @vote.update(vote_params)
      # redirect_to root_path
      return
    else
      render :edit
      return
    end
  end
  
  def destroy
    vote_id = params[:id]
    @vote = Vote.find_by(id: vote_id)
    
    if @vote.nil?
      head :not_found
      return
    end
    
    @vote.destroy
    # redirect_to works_path
    return
  end
  
  private
  
  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end
end
