class SearchController < ApplicationController
    def index
        searchTerm = params[:searchterm]

        uri = "https://api.themoviedb.org/3/search/movie?api_key=83e72b5e80c8d6af6be012cfc689dfb8&query=#{searchTerm}&page=1&include_adult=false";
        response = HTTParty.get(uri);
        
         movies = []
         response["results"].each do |item|
             movie = Search.new(item["id"], item["title"], item["poster_path"], item["release_date"])
             movies.push(movie)
         end
        render json: movies
    end
end

class Search
    def initialize(id, title, poster, release_date)
    @id=id
    @title=title
    @poster=poster
    @release_date=release_date
    end
end

