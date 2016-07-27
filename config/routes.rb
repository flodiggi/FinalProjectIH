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

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')




end
