Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'site#home'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/userslink' => 'users#createandlinktoactivity'
  get '/profile' => 'users#show'
  get '/users' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/join' => 'sessions#createandlink'

  delete '/logout' => 'sessions#destroy'

  resources :activity
  resources :date_entries
  resources :location_entries
  resources :time_entries
  resources :groups
  resources :comments
  resources :hosts, only: [:create]

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')


  patch '/activity/:id/password', to: 'activity#updatepasswort'
  patch '/activity/:id/groups/:id', to: 'groups#update'
  patch '/activity/:id/groups', to: 'activity#addgroups'
  get '/activity/:id/joinus', to: 'activity#access'
  get '/activity/:id/join', to: 'users#join'
  post '/activity/login', to: 'activity#login'
  post '/activity/:id/removeuser', to: 'activity#removeuser'
  post '/votedate', to: 'activity#votingdate'
  post '/votetime', to: 'activity#votingtime'
  post '/votelocation', to: 'activity#votinglocation'

  post '/comments/:id/delete', to: 'comments#destroy'
  post '/activity/:id/delete', to: 'activity#destroy'

  post '/groups/:id/deleteuser', to: 'groups#deleteuser'
  post '/groups/delete', to: 'groups#delete'




end
