Rails.application.routes.draw do
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
      post '/sources_search', to: 'sources#search'

      post '/wolfram_favorite', to: 'wolfram#favorite'
      post '/youtube_favorite', to: 'youtube#favorite'
      post '/news_favorite', to: 'news#favorite'
      post '/faroo_favorite', to: 'faroo#favorite'
      post '/reddit_favorite', to: 'reddit#favorite'
      post '/sources_favorite', to: 'sources#favorite'

      get '/reddit_login', to: 'reddit#login'
      post '/reddit_token', to: 'reddit#access_token'
      post '/reddit_funny', to: 'reddit#reddit_funny'
      post '/reddit_aww', to: 'reddit#reddit_aww'
      post '/reddit_popular', to: 'reddit#reddit_popular'
      post '/reddit_til', to: 'reddit#reddit_til'
      post '/reddit_pics', to: 'reddit#reddit_pics'
      post '/reddit_self', to: 'reddit#reddit_self'
      post '/reddit_post', to: 'reddit#reddit_post'

    end
  end
end
