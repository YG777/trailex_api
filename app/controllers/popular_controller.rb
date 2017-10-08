class PopularController < ApplicationController
    def index
    response = HTTParty.get("https://api.themoviedb.org/3/movie/popular?api_key=83e72b5e80c8d6af6be012cfc689dfb8&language=en-US&page=1")
   
    movies = []
        response["results"].each do |item|
            movie = PopularMovie.new(item["id"], item["title"], item["poster_path"], item["release_date"])
            movies.push(movie)
        end
        render json: movies
    end
end

class PopularMovie
   def initialize(id, title, poster, release_date)
        @id=id 
        @title=title
        @poster=poster
        @release_date=release_date
   end
end



