class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order("created_at DESC")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render 'edit'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :director)
  end

  def find_movie
   @movie = Movie.find(params[:id])
  end
end
