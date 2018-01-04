class Api::V1::SpotifyController < ApplicationController
  def login
    authorize_login = {
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      response_type: "code",
      redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
      scope: "user-library-read user-library-modify user-top-read user-modify-playback-state playlist-modify-public user-read-recently-played user-read-currently-playing",
      show_dialog: true
    }
    redirect_to "https://accounts.spotify.com/authorize?#{authorize_login.to_query}"
  end

  def access_token
    body = {
      grant_type: "authorization_code",
      code: params[:code],
      redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      client_secret: ENV['SPOTIFY_CLIENT_SECRET']
    }
    resp = RestClient.post("https://accounts.spotify.com/api/token", body)
    resp_json = JSON.parse(resp.body)

    encoded_access_token = JWT.encode({spotify_access_token: resp_json['access_token']}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
    encoded_refresh_token = JWT.encode({spotify_refresh_token: resp_json['refresh_token']}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
    my_user.update(spotify_access_token: encoded_access_token, spotify_refresh_token: encoded_refresh_token)

    render json: {success: "Success"}
  end

  def spotify_self
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/me', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_user_playlists
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/me/playlists', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_user_top_tracks
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/me/top/tracks', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_user_top_artists
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/me/top/artists', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_user_recent_tracks
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/me/player/recently-played', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_search_track
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get("https://api.spotify.com/v1/search?q="+params[:search_term]+"&type=track&limit=50", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_search_artist
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/search?q=' + params[:search_term]+"&type=artist&limit=50", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_artist_tracks
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/artists/'+params[:artistId]+'/top-tracks?country=US', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_search_playlists
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/search?q='+params['search_term']+'&type=playlist&limit=20', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def spotify_featured_playlists
    decoded = JWT.decode(my_user['spotify_access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['spotify_access_token'] }
    resp = RestClient.get('https://api.spotify.com/v1/browse/featured-playlists&limit=20', header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

end
