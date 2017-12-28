class Api::V1::RedditController < ApplicationController

  def reddit_login
    # byebug
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

  def create
    # byebug
    header = {
      Authorization: {
        user: "HIAI5riSoSqPIg",
        password: "ojw9ifk9Vvp7NGeasv0Q9uJg14k"
      }
    }

    body = {
      grant_type: "authorization_code",
      code: params[:code],
      redirect_uri: ENV['REDDIT_REDIRECT_URI']
    }

    # resp = RestClient::Request.new(
    #   method: :post,
    #   url: "https://www.reddit.com/api/v1/access_token",
    #   user: ENV['REDDIT_CLIENT_ID'],
    #   password: ENV['REDDIT_CLIENT_SECRET'],
    #   headers: {accept: :json, content_type: "application/x-www-form-urlencoded"},
    #   grant_type: "authorization_code",
    #   code: params[:code],
    #   redirect_uri: ENV['REDDIT_REDIRECT_URI']
    # ).execute

    # resp_json = JSON.parse(resp.body)
    # render json: resp_json

    token_resp = RestClient.post("https://www.reddit.com/api/v1/access_token", header, body)
    token_resp_json = JSON.parse(token_resp.body)
    render json: token_resp_json
    byebug
    # byebug
    # header = {Authorization: "Bearer"}
  end
end
