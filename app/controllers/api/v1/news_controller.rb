class Api::V1::NewsController < ApplicationController
  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    resp = RestClient.get("https://www.googleapis.com/youtube/v3/search?part=snippet&key="+ENV['YOUTUBE_KEY']+"&q="+params['search_term']+"&type=video&maxResults=10")
    resp_json = JSON.parse(resp)
    render json: resp_json
  end
end
