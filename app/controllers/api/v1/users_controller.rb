class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: {users: @users}
  end

  # def new
  #   # displays initial information when signing up
  # end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      if @user && @user.authenticate(params[:user][:password])
        token = JWT.encode({user_id: @user.id}, ENV['SECRET_KEY'], ENV['ALGORITHM'])
        render json: {user: @user, token: token}
      end
    else
      render json: {error: 'Error creating new user.'}, status: 401
    end
  end

  def show
    token = request.headers['token']
    decoded = JWT.decode(token, ENV['SECRET_KEY'], ENV['ALGORITHM'])
    @user = User.find_by(id: decoded.first['user_id'])
    if @user
      render json: {user: @user}
    else
      render json: {error: 'No user found.'}, status: 401
    end
  end

  # def update
  #   # update user info
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :full_name, :email, :phone_number, :profile_pic, :status, :biography, :interests)
  end
end
