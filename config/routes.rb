Rails.application.routes.draw do
  resources :sources
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

      post '/click', to: 'clicks#create'

      post '/wolfram_search', to: 'wolfram#search'
      post '/youtube_search', to: 'youtube#search'
      post '/news_search', to: 'news#search'
      post '/faroo_search', to: 'faroo#search'
      post '/reddit_search', to: 'reddit#search'
      post '/sources_search', to: 'sources#search'

      post '/wolfram_favorite', to: 'wolfram#favorite'
      post '/youtube_favorite', to: 'youtube#favorite'
      post '/news_favorite', to: 'news#favorite'
      post '/faroo_favorite', to: 'faroo#favorite'
      post '/reddit_favorite', to: 'reddit#favorite'
      post '/sources_favorite', to: 'sources#favorite'

      get '/reddit_login', to: 'reddit#reddit_login'
      get '/reddit_token', to: 'reddit#create'
    end
  end
end
