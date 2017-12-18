class Api::V1::UsersController < ApplicationController

  def new
    # displays initial information when signing up
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      if @user && @user.authenticate(params[:user][:password])
        token = JWT.encode({user_id: @user.id}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
        render json: {id: @user.id, username: @user.username, token: token}
      end
    else
      render json: {error: 'Error creating new user.'}
    end
  end

  def update
    # update user info
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
