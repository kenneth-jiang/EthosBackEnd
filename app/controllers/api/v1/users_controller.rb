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
    decoded = JWT.decode((request.headers['token']), ENV['SECRET_KEY'], ENV['ALGORITHM'])
    decoded_id = decoded[0]['user_id']
    @user = User.find_by(id: decoded_id)
    if @user
      render json: {user: @user}
    else
      render json: {error: 'No user found.'}, status: 401
    end
  end

  def update
    if my_user
      my_user.update(user_params)
      render json: {user: my_user}
    else
      render json: {error: "Could not update user."}, status: 401
    end
  end

  def profile_pic
    @user = User.find_by(username: params[:username])
    if @user
      render json: {profile_pic: @user.profile_pic}
    else
      render json: {error: "Could not find username."}
    end
  end

  def favorites
    @user = my_user
    if @user
      @wolfram = @user.wolfram
      @news = @user.news
      @sources = @user.sources
      @reddit = @user.reddit
      @spotify = @user.spotify
      @youtube = @user.youtube
      render json: {favorites: [@wolfram, @news, @sources, @reddit, @spotify, @youtube]}
    else
      render json: {error: "User not found."}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :phone, :location, :birthday, :gender, :interests, :about, :private, :profile_pic, :status)
  end
end
