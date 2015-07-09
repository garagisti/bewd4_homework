class MoviesController < ApplicationController
  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/:id
  def show
    fetch_movie
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(white_listed_parameters)
    if @movie.save
      flash[:notice] = 'Movie Saved Successfully!'
      redirect_to movies_path
    else
      render :new
    end
  end

  # PUT /movies
  def update
    fetch_movie
    if @movie.update_attributes(white_listed_parameters)
      flash[:notice] = 'Movie Updated Successfully!'
      redirect_to movies_path
    else
      render :edit
    end
  end

  # GET /movie/:id/edit
  def edit
    fetch_movie
  end

  private

  # Get's the movie from the database, and redirects if unable to find one
  def fetch_movie
    begin
      @movie = Movie.find(params[:id])
    rescue
      redirect_to movies_path
    end
  end

  # White lists the corresponding parameters
  def white_listed_parameters
    params
      .require(:movie)
      .permit(:title, :description, :year_released)
  end
end
