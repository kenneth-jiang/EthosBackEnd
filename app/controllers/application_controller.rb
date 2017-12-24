class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  #
  # # before_action :authorized
  #
  def my_user
    decoded = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
    decoded_id = decoded[0]['user_id']
    currentUser = User.find_by(id: decoded_id)
  end

  # def headers
  #   decoded = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY'], ENV['ALGORITHM'])
  #   header = {'Authorization': 'Bearer ' + decoded[0]['access_token']}
  #   byebug
  # end
  # def issue_token(payload)
  #   JWT.encode(payload, ENV['SECRET_KEY'], ENV['ALGORITHM'])
  # end
  #
  # def decode_token(payload)
  #   begin
  #     JWT.decode(payload, ENV['SECRET_KEY'], true, ENV['ALGORITHM'])
  #   rescue JWT::DecodeError
  #     return nil
  #   end
  # end
  #
  #
  # def logged_in?
  #   !!current_user
  # end

  # def authorized
  #   render json: {error: "Access denied: not authorized."}, status: 401 unless logged_in?
  # end

end
