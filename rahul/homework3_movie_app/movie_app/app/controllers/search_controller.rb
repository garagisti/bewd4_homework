class SearchController < ApplicationController
  def index
    if params[:search]
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end
end
