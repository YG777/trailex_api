class WatchlistController < ApplicationController
  def index
    render json: Watchlist.where(user_id: @current_user.id)
  end

  def create
    user_id = @current_user.id
    movie_id = params[:movie_id]
    movie_title = params[:movie_title]
    if Watchlist.where(user_id: user_id, movie_id: movie_id).length == 0
      Watchlist.create(user_id: user_id,  movie_id: movie_id,  movie_title: movie_title)
    end
  end

  def destroy
    movie_id = params[:id]
    user_id =  @current_user.id
    Watchlist.where(user_id: user_id, movie_id: movie_id).destroy_all
  end
end
