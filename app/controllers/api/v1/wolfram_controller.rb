class Api::V1::WolframController < ApplicationController
  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    resp = RestClient.get('http://api.wolframalpha.com/v2/query?appid='+ENV['WOLFRAM_KEY']+"&input="+params['search_term']+"&format=image&output=json")
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

  def favorite
    byebug
    @wolfram = Wolfram.find_by(result_id: params[:id])
    if (!@wolfram)
      Wolfram.create(wolfram_data: params, user_id: my_user.id)
      render json: {success: "Success"}
    else
      render json: {error: "Already created"}
    end
  end

end
