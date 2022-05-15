Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/parks', to: 'parks#index'
  get '/parks/new', to: 'parks#new'
  get '/parks/:id', to: 'parks#show'
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  get '/parks/:id/trails', to: 'park_trails#index'
  post '/parks', to: 'parks#create'

end
