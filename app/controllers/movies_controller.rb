class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    if (params[:ratings] and params[:commit] == 'Refresh')
        @select_ratings = params[:ratings].keys
    elsif params[:ratings]
        @select_ratings = params[:ratings]
    else
        @select_ratings = session[:ratings] || @all_ratings
    end
    
    @by_column = params[:sort_order] || session[:sort_order]
    (@t,@r = '','') unless @by_column
    (@t,@r = "hilite","") if  @by_column =~ /title/
    (@r,@t = "hilite","") if  @by_column =~ /release_date/
    
    if params[:sort_order] != session[:sort_order] or params[:ratings] != session[:ratings]
        session[:ratings] = @select_ratings
        session[:sort_order] = @by_column
        redirect_to movies_path :sort_order => @by_column, :ratings => @select_ratings and return
    end
    @movies = Movie.order(@by_column).where(rating: @select_ratings)
    
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
