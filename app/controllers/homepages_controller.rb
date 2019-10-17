class HomepagesController < ApplicationController
  def index
    # @works = Work.all  
    #@movies = Work.sort_by_category("movie").take(10)
    @books = Work.sort_by_category("book").take(10)
    @albums = Work.sort_by_category("album").take(10)
  end 
end
