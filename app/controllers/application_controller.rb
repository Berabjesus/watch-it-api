class ApplicationController < ActionController::API
  # if the token verificaion fails
  rescue_from JWT::VerificationError, with: 'false'
  attr_reader :current_user_id
  def initialize 
    super
    @secret = Rails.application.secrets.secret_key_base[0]
    @current_user_id = nil
    @current_user = nil
  end

  def encode user_id
    JWT.encode({
                  user_id: user_id,
                  }, @secret, 'HS256', { expiresIn: 24.hours.from_now.to_i })
  end

  def decode(token)
    JWT.decode(token, @secret)
  end

  def logged_in?
    if !authorization_header
      false
    else
      token = authorization_header.split(" ")[1]
      begin
        decoded_token = decode(token)
      rescue StandardError
        return false
      else
        @current_user_id = decoded_token[0]['user_id'] if @current_user_id.nil?
      end
      true
    end
  end

  def current_user
    @current_user = User.find(@current_user_id)
  end

  def authorization_header
    request.headers.to_h["HTTP_AUTHORIZATION"]
  end
end