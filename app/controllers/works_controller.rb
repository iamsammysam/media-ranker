class WorksController < ApplicationController
  
  def index 
    @works = Work.all
    @movies = Work.sort_by_category("movie")
    @books = Work.sort_by_category("book")
    @albums = Work.sort_by_category("album")
  end
  
  def show
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
    
    if @work.nil?
      # redirect_to works_path
      return
    end   
  end
  
  def new
    @work = Work.new
  end
  
  def create
    @work = Work.new(passenger_params) 
    if @work.save 
      # redirect_to work_path(@work.id)
      return
    else
      render :new
      return
    end
  end
  
  def edit
    @work = Work.find_by(id: params[:id])
    
    if @work.nil?
      # redirect_to works_path
      return
    end
  end
  
  def update
    @work= Work.find_by(id: params[:id])
    if @work.update(work_params)
      # redirect_to root_path
      return
    else
      render :edit
      return
    end
  end
  
  def destroy
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
    
    if @work.nil?
      head :not_found
      return
    end
    
    @work.destroy
    # redirect_to works_path
    return
  end
  
  private
  
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
  end
end
