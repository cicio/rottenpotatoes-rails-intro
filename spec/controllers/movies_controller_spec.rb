require 'rails_helper'
require 'rspec/expectations'

describe MoviesController do
    describe 'Sort by Release Date' do
      before(:each) do
        movie1 = Movie.new(:title => 'Aladdin', :release_date => '2000-12-25')
        movie2 = Movie.new(:title => 'Sting', :release_date => '1980-12-25')
        @movies = [@movie1, @movie2]
      end
      it 'is sorted by release date with earliest-released movies first' do
        get '/movies?id=title_header' 
        @movies.all.order('release_date')
        expect(@movies).to eq [@movies.first, @movies.last]
      end
    end
    describe 'Sort by Movie Title' do
      it 'is listed with title in ascending alphabetical order'
    end
 # end
end