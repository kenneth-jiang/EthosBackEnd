class Api::V1::WolframController < ApplicationController

  def create
    # @user_id = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    # @user = User.find_by(id: @user_id[0]['user_id'])
    # @wolfram_search = WolframSearch.create(search_term: wolfram_search_params['searches'], user_id: @user_id[0]['user_id'])
    # @user.wolfram_searches << @wolfram_search
    # resp = RestClient.get('http://api.wolframalpha.com/v2/query?appid='+ENV['WOLFRAM_KEY']+"&input="+wolfram_search_params['searches']+"&format=image&output=json")
    # resp_json = JSON.parse(resp)
    # render json: resp_json
  end

  def search
    Search.create(search_term: params['search_term'], user_id: my_user.id)
    resp = RestClient.get('http://api.wolframalpha.com/v2/query?appid='+ENV['WOLFRAM_KEY']+"&input="+params['search_term']+"&format=image&output=json")
    resp_json = JSON.parse(resp)
    render json: resp_json
  end

end
