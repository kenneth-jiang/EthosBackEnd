class Api::V1::AuthorizationController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      token = JWT.encode({user_id: @user.id}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
      render json: {id: @user.id, username: @user.username, token: token}
    else
      render json: {error: "Error signing in."}
    end
  end

  def show
    token = request.headers['token']
    decoded = JWT.decode(token, ENV['SECRET_KEY'], ENV['ALGORITHM'])
    @user = User.find_by(id: decoded.first['user_id'])
    if @user
      render json: @user
    else
      render json: {error: 'No user found.'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
