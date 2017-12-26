class Api::V1::AuthorizationController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      token = JWT.encode({user_id: @user.id}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
      render json: {user: @user, token: token}
    else
      render json: {error: "Error signing in."}, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :full_name, :email, :phone_number, :profile_pic, :status, :biography, :interests)
  end
end
