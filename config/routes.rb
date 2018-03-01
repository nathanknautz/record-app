Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  #record routes
  get "/records" => 'records#index'
  get "/records/:id" => 'records#show'
  post "/records" => 'records#create'
  patch "/records" => 'records#update'
  delete "/records/:id" => 'records#destroy'

  #user record routes
  get "/user_records" => 'user_records#index'
  get "/user_records/:id" => 'user_records#show'
  post "/user_records" => 'user_records#create'
  delete "/user_records/:id" => 'user_records#destroy'

  #user routes
  post "/users" => 'users#create'

  #artist routes
  get "/artists" => 'artists#index'
  get "/artists/:id" => 'artists#show'
  post "/artists" => 'artists#create'
  patch "/artists/:id" => 'artists#update'
  delete "/artists/:id" => 'artists#destroy'

  #genre routes
  get "/genres" => 'genres#index'
  get "/genres/:id" => 'genres#show'
  post "/genres" => 'genres#create'
  patch "/genres/:id" => 'genres#update'
  delete "/genres/:id" => 'genres#destroy'
  
  #spotify
  get '/spotify/authorize' => 'related_artists#authorize'
  get '/spotify/callback' => 'related_artists#callback'
  get '/spotify/tokens' => 'related_artists#tokens'
  get '/spotify/profile' => 'related_artists#profile'

end
