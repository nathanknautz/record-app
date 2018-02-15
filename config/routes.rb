Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  #record routes
  get "/records" => 'records#index'
  get "/records/:id" => 'records#show'
  post "/records" => 'records#create'
  patch "/records" => 'records#update'

  #user record routes
  get "/user_records" => 'user_records#index'
  post "/user_records" => 'user_records#create'
  delete "/user_records" => 'user_records#destroy'

  #user routes
  post "/users" => 'users#create'
  

end
