if params[:commit] == 'Refresh'
      params[:id] = session[:id]
      @by_column = params[:id] 
      @movies = Movie.order(params[:id]).select {|movie| movie.rating.in?(@select_ratings) }
      @by_column =~ /title/ ? (@t,@r = "hilite","") : (@r,@t = "hilite","")
      @t,@r = '','' if @by_column =~ /id/
      
    end