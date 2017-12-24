Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#create'
      post '/login', to: 'authorization#create'
      get '/current_user', to: 'authorization#show'
      post '/search', to: 'searches#create'
      get '/personalities', to: 'personalities#show'
    end
  end
end
