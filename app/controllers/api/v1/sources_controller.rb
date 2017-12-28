class Api::V1::SourcesController < ApplicationController
  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    resp = RestClient.get("https://newsapi.org/v2/top-headlines?sources="+params['search_term']+"&apiKey="+ENV['NEWS_KEY'])
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def favorite
    @source = Source.find_by(sourceid: params['id'])
    if (!@source)
      Source.create(
        sourceid: params['id'],
        name: params['name'],
        description: params['description'],
        url: params['url'],
        category: params['category'],
        country: params['country'],
        user_id: my_user.id
      )
      render json: {success: "Success"}
    else
      render json: {error: "Already created"}
    end
  end
end
