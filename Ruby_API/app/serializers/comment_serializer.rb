class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :movie_id, :body
end
