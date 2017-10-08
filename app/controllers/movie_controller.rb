class MovieController < ApplicationController
  def show
    movie_id = params[:id]
    response = HTTParty.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=83e72b5e80c8d6af6be012cfc689dfb8&append_to_response=videos")

    watchlist = Watchlist.where(user_id: @current_user.id, movie_id: movie_id)
    puts watchlist.length
    
    videoKeys = []
    response["videos"]["results"].each do |video_details|
      if video_details["site"] == "YouTube"
        key = video_details["key"]
        videoKeys.push(key)
      end
    end

    showMovie = ShowMovie.new(
      response["id"], 
      response["title"], 
      response["poster_path"], 
      response["release_date"],
      videoKeys,
      watchlist.length >  0)
    render json: showMovie
  end

  def comments
    movie_id = params[:id]
    comments = Comment.where("comments.movie_id = #{movie_id}")
    render json: comments
  end

  def addComment
    movie_id = params[:id]
    user_id = @current_user.id
    user_name =  @current_user.username
    comment = params[:comment]
    Comment.create(movie_id: movie_id, user_id: user_id, body: comment, username: user_name)
  end
end

class ShowMovie
  def initialize(id, title, poster, release_date, video_keys, in_watchlist)
    @id = id
    @title = title
    @poster = poster
    @release_date = release_date
    @video_keys = video_keys
    @in_watchlist =  in_watchlist
  end
end


