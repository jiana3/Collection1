Rails.application.routes.draw do
  
  # get 'user/new'

  # get 'user/create'

  # get 'user/edit'

  # get 'user/destroy'

  # Root is the unauthenticated path
  root 'sessions#unauth'

  # Sessions URL
  get 'sessions/unauth', as: :login
  post 'sessions/login', as: :signin
  delete 'sessions/logout', as: :logout

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  # Resourceful routes for posts
  resources :posts

end
