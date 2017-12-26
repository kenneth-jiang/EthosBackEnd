class ApplicationController < ActionController::API
  # before_action :authorized

  def my_user
    decoded = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    decoded_id = decoded[0]['user_id']
    currentUser = User.find_by(id: decoded_id)
  end

  # def logged_in?
  #   byebug
  #   !!my_user
  # end
  #
  # def authorized
  #   byebug
  #   render json: {error: "Access denied: not authorized."}, status: 401 unless logged_in?
  # end

end
