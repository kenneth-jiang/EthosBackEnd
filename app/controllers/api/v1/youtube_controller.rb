class Api::V1::YoutubeController < ApplicationController

  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    resp = RestClient.get("https://www.googleapis.com/youtube/v3/search?part=snippet&key="+ENV['YOUTUBE_KEY']+"&q="+params['search_term']+"&type=video&maxResults=10")
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def favorite
    @youtube = Youtube.find_by(videoId: params[:id][:videoId])
    if (!@youtube)
      Youtube.create(
        videoId: params[:id][:videoId],
        channelId: params[:snippet][:channelId],
        title: params[:snippet][:title],
        description: params[:snippet][:description],
        image_url: params[:snippet][:thumbnails][:medium][:url],
        user_id: my_user.id
      )
      render json: {success: "Success"}
    else
      render json: {error: "Already created"}
    end
  end

end
