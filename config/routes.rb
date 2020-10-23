Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  get '/amusement_parks/:id', to: 'amusement_parks#show'
  post '/ride_mechanics/:mechanic_id', to: 'ride_mechanics#create'
end
