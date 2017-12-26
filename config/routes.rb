Rails.application.routes.draw do
  resources :faroos
  resources :reddits
  resources :clicks
  resources :searches
  resources :spotifies
  resources :youtube_videos
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#create'
      post '/login', to: 'authorization#create'

      get '/all_users', to: 'users#index'
      get '/current_user', to: 'users#show'

      get '/personalities', to: 'personalities#show'

      post '/wolfram_search', to: 'wolfram#search'

    end
  end
end
