class ApplicationController < ActionController::API
  def my_user
    decoded = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    decoded_id = decoded[0]['user_id']
    currentUser = User.find_by(id: decoded_id)
  end
end
