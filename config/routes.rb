Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/parks', to: 'parks#index'
  get '/parks/new', to: 'parks#new'
  get '/parks/:id', to: 'parks#show'
  post '/parks', to: 'parks#create'
  get 'parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'

  get '/trails', to: 'trails#index'
  get '/trails/:id/edit', to: 'trails#edit'
  get '/trails/:id', to: 'trails#show'
  patch '/trails/:id', to: 'trails#update'



  post '/parks/:id/trails', to: 'park_trails#create'
  get '/parks/:id/trails/new', to: 'park_trails#new'
  get '/parks/:id/trails', to: 'park_trails#index'




end
