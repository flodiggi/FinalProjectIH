Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'site#home'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/profile' => 'users#show'
  get '/users' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :activity
  resources :date_entries
  resources :location_entries
  resources :time_entries
  resources :groups
  resources :comments

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/activity/:id/joinus', to: 'activity#access'
  post '/activity/login', to: 'activity#login'
  post '/votedate', to: 'activity#votingdate'
  post '/votetime', to: 'activity#votingtime'
  post '/votelocation', to: 'activity#votinglocation'




end
