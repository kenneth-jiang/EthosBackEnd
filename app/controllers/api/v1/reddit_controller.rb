class Api::V1::RedditController < ApplicationController
  def login
    authorize_login = {
      client_id: ENV['REDDIT_CLIENT_ID'],
      response_type: "code",
      state: "asdf",
      redirect_uri: ENV['REDDIT_REDIRECT_URI'],
      duration: "permanent",
      scope: "identity, edit, flair, history, modconfig, modflair, modlog, modposts, modwiki, mysubreddits, privatemessages, read, report, save, submit, subscribe, vote, wikiedit, wikiread"
    }
    redirect_to "https://www.reddit.com/api/v1/authorize?#{authorize_login.to_query}"
  end

  def access_token
    resp = RestClient::Request.new(
      method: :post,
      url: "https://www.reddit.com/api/v1/access_token",
      user: ENV['REDDIT_CLIENT_ID'],
      password: ENV['REDDIT_CLIENT_SECRET'],
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      payload: {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: ENV['REDDIT_REDIRECT_URI']
      },
    ).execute
    resp_json = JSON.parse(resp.body)

    encoded_access_token = JWT.encode({access_token: resp_json['access_token']}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
    encoded_refresh_token = JWT.encode({refresh_token: resp_json['refresh_token']}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
    my_user.update(access_token: encoded_access_token, refresh_token: encoded_refresh_token)

    render json: {success: "Success"}
  end

  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/r/search?q="+params['search_term'], header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_funny
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/r/funny/", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_popular
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/r/popular/", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_aww
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/r/aww/", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_til
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/r/todayilearned/", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_pics
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/r/pics/", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_self
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/api/v1/me/", header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def reddit_post
    
    decoded = JWT.decode(my_user['access_token'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    header = { 'Authorization': "Bearer " + decoded[0]['access_token'] }
    resp = RestClient.get("https://oauth.reddit.com/"+params['permalink'], header)
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def favorite
    @reddit = Reddit.find_by(redditId: params['data']['id'])
    if (!@reddit)
      Reddit.create(
        redditId: params['data']['reddit_id'],
        title: params['data']['title'],
        author: params['data']['author'],
        created_utc: params['data']['created_utc'],
        num_comments: params['data']['num_comments'],
        permalink: params['data']['permalink'],
        subreddit_name_prefixed: params['data']['subreddit_name_prefixed'],
        subreddit_id: params['data']['subreddit_id'],
        thumbnail: params['data']['thumbnail'],
        url: params['data']['url'],
        user_id: my_user.id
      )
      render json: {success: "Success"}
    else
      render json: {error: "Already created"}
    end
  end

end
