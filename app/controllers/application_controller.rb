class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  #
  # before_action :authorized
  #
  # def issue_token(payload)
  #   JWT.encode(payload, ENV['SECRET_KEY'], ENV['ALGORITHM'])
  # end
  #
  # def decode_token(payload)
  #   begin
  #     JWT.decode(payload, ENV['SECRET_KEY'], true, ENV['ALGORITHM')
  #   rescue JWT::DecodeError
  #     return nil
  #   end
  # end
  #
  # def current_user
  #   authenticate_or_request_with_http_token do |token, options|
  #     if decode_token(token)
  #       user_id = decode_token.first['user_id']
  #       @current_user ||= User.find_by(id: user_id)
  #     end
  #   end
  # end
  #
  # def logged_in?
  #   !!current_user
  # end
  #
  # def authorized
  #   render json: {error: "Access denied: not authorized."}, status: 401 unless logged_in?
  # end

end
