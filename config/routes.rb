Rails.application.routes.draw do
  # scope :api do
    resources :watchlist
    resources :movie
    resources :popular
    resources :search
    resources :users, except: [:create]
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    get 'movie/:id/comments', to: 'movie#comments'
    post 'movie/:id/comments', to: 'movie#addComment'
    # end
end
