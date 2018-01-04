Rails.application.routes.draw do
  resources :tones
  mount ActionCable.server, at: '/cable'

  namespace :api do
    namespace :v1 do
      post '/signup', to: 'users#create'
      post '/login', to: 'authorization#create'

      get '/all_users', to: 'users#index'
      get '/current_user', to: 'users#show'
      post '/update_user', to: 'users#update'
      post '/profile_pic', to: 'users#profile_pic'
      get '/user_favorites', to: 'users#favorites'

      get '/create_user_personality', to: 'personalities#create'
      get '/show_user_personality', to: 'personalities#show'

      get '/create_user_tones', to: 'tones#create'
      get '/show_user_tones', to: 'tones#show'

      post '/click', to: 'clicks#create'

      get '/all_messages', to: 'messages#index'
      post '/send_message', to: 'messages#create'

      post '/wolfram_search', to: 'wolfram#search'
      post '/wolfram_favorite', to: 'wolfram#favorite'

      post '/news_search', to: 'news#search'
      post '/news_favorite', to: 'news#favorite'
      post '/sources_search', to: 'sources#search'
      post '/sources_favorite', to: 'sources#favorite'

      post '/youtube_search', to: 'youtube#search'
      post '/youtube_favorite', to: 'youtube#favorite'

      get '/reddit_login', to: 'reddit#login'
      post '/reddit_token', to: 'reddit#access_token'
      post '/reddit_funny', to: 'reddit#reddit_funny'
      post '/reddit_aww', to: 'reddit#reddit_aww'
      post '/reddit_popular', to: 'reddit#reddit_popular'
      post '/reddit_til', to: 'reddit#reddit_til'
      post '/reddit_pics', to: 'reddit#reddit_pics'
      post '/reddit_custom', to: 'reddit#reddit_custom'
      post '/reddit_self', to: 'reddit#reddit_self'
      post '/reddit_post', to: 'reddit#reddit_post'
      post '/reddit_favorite', to: 'reddit#favorite'

      get '/spotify_login', to: 'spotify#login'
      post '/spotify_token', to: 'spotify#access_token'
      post '/spotify_self', to: 'spotify#spotify_self'
      post 'spotify_user_playlists', to: 'spotify#spotify_user_playlists'
      post '/spotify_user_top_tracks', to: 'spotify#spotify_user_top_tracks'
      post '/spotify_user_top_artists', to: 'spotify#spotify_user_top_artists'
      post '/spotify_user_recent_tracks', to: 'spotify#spotify_user_recent_tracks'
      post '/spotify_search_track', to: 'spotify#spotify_search_track'
      post '/spotify_search_artist', to: 'spotify#spotify_search_artist'
      post '/spotify_artist_tracks', to: 'spotify#spotify_artist_tracks'
      post '/spotify_search_playlists', to: 'spotify#spotify_search_playlists'
      post '/spotify_featured_playlists', to: 'spotify#spotify_featured_playlists'

    end
  end
end
