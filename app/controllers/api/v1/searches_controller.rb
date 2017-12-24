class Api::V1::SearchesController < ApplicationController
  def create
    @user_id = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    @user = User.find_by(id: @user_id[0]['user_id'])
    @search = Search.create(search_term: search_params['search_term'], user_id: @user_id[0]['user_id'])
    @user.searches << @search
    url = "http://api.wolframalpha.com/v2/query?appid="
    resp = RestClient.get("http://api.wolframalpha.com/v2/query?appid="+ENV["WOLF_KEY"]+"&input="+search_params["search_term"]+"&format=image&output=json")
    parsed = JSON.parse(resp)
    render json: parsed
  end

  private

  def search_params
    params.require(:search).permit(:search_term)
  end
end
