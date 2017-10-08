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

# 1. get id values from the search response 
#  response is an array of objects (instances of class Search) stored  in variable movies

# 2. when the id values are found, store them in variable  videos

# 3. # if id is  requested , send a new get request to the external API to get a link to video/s by id

            # def show
            #     movie_id = video
            #     uri = "https://api.themoviedb.org/3/movie/{movie_id}/videos?api_key=83e72b5e80c8d6af6be012cfc689dfb8&language=en-US
            #     "
            #     response = HTTParty.get(uri);
            #     videos = []
            #     response["results"].each do |item|
            #         video = Search.new(item["key"])
            #         videos.push(video)
            #     end
            # end

# render the data
