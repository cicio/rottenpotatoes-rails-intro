class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings

    params[:ratings].respond_to?(:keys) ? @select_ratings = params[:ratings].keys :
        								  @select_ratings = params[:ratings] || session[:ratings]
    session[:ratings] = @select_ratings
    @by_column = params[:sort_order] || session[:sort_order]
    (@t,@r = '','') unless @by_column
    (@t,@r = "hilite","") if  @by_column =~ /title/
    (@r,@t = "hilite","") if  @by_column =~ /release_date/
    @movies = Movie.order(@by_column).where(rating: @select_ratings)
    session[:sort_order] = @by_column
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
