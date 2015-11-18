require 'rails_helper'
require 'rspec/expectations'


describe MoviesController do
    before(:each) do
      @movies = [{:title => 'Aladdin', :release_date => '2000-12-25', :rating => 'G'},
         {:title => 'Sting', :release_date => '1980-12-25', :rating => 'PG-13'},
         {:title => 'Terminator', :release_date => '1985-12-25', :rating => 'R'},
         {:title => 'I Robot', :release_date => '2005-12-25', :rating => 'PG'}].
      each {|movie| Movie.create(movie)}
    end
    
    describe 'sort movies by release date' do
      it 'sorts by release date with earliest-released movies first' do
        get :index, {:id => 'release_date_header'}
        Movie.order(:release_date)
        expect(Movie.order(:release_date).first.title).to eq 'Sting'
      end
    end
    
    describe 'sort by title' do
      it 'sorts movies by title' do
        get :index, {:id => 'title'}
        Movie.order(:title)
        expect(Movie.order(:title).first.title).to eq 'Aladdin'
      end
    end
    
    describe 'all ratings', 'class method to generate all movie ratings' do
      it 'generates an array of unique MPAA ratings' do
        expect(Movie.all_ratings).to eq(['G','PG','PG-13','R'])
      end 
    end
    
    describe 'filter select ratings' do
      before(:each) do
        get :index, {:ratings=>{"G"=>"1", "PG-13"=>"1"}}
        @selections = ["G", "PG-13"]
        @selected_movies = [@movies[0],@movies[1]]
      end
      it 'figures out which boxes the user checked' do
        expect(@selections).to eq ["G", "PG-13"]
      end
      it 'shows only movies from selected ratings' do
        expect(Movie.where(rating: @selections).count).to eq 2
        expect(Movie.where(rating: @selections).first.rating).to eq "G"
      end
    end
end