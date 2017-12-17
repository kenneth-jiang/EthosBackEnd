class Api::V1::UsersController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = JWT.encode({user_id: user.id}, 'secret', 'HS256')
      render json: {id: @user.id, username: @user.username, jwt: token}
    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end

end
