class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :movie_id, :movie_title
end
