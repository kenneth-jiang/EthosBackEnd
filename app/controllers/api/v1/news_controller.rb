class Api::V1::NewsController < ApplicationController

  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    if params['startDate'] && params['endDate']
      resp = RestClient.get("https://newsapi.org/v2/everything?q="+params['search_term']+"&from="+params['startDate']+"&to="+params['endDate']+"&language=en&apiKey="+ENV['NEWS_KEY'])
      resp_json = JSON.parse(resp)
      render json: resp_json
    else
      resp = RestClient.get("https://newsapi.org/v2/everything?q="+params['search_term']+"&language=en&apiKey="+ENV['NEWS_KEY'])
      resp_json = JSON.parse(resp)
      render json: resp_json
    end
  end

  def favorite
    @news = News.find_by(name: params[:name])
    if (!@news)
      News.create(
        name: params[:name],
        author: params[:author],
        description: params[:description],
        url: params[:url],
        image_url: params[:urlToImage],
        user_id: my_user.id
      )
      render json: {success: "Success"}
    else
      render json: {error: "Already created"}
    end
  end

end
