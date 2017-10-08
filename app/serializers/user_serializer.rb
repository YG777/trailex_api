class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :email
end
