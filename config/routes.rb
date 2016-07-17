Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to:'site#home'

  get '/start', to: 'activity#new'

  post '/create', to: 'activity#create'

  get '/activity', to: 'activity#activity'

end
