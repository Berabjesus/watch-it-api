class ApplicationController < ActionController::API
  # if the token verificaion fails
  rescue_from JWT::VerificationError, with: 'false'
  attr_reader :current_user_id

  def initialize
    super
    @secret = 'bereket'
    @current_user_id = nil
  end

  def encode(user_id)
    JWT.encode({
                 user_id: user_id
               }, @secret, 'HS256', { expiresIn: 24.hours.from_now.to_i })
  end

  def decode(token)
    JWT.decode(token, @secret)
  end

  def logged_in?
    if !authorization_header
      false
    else
      token = authorization_header.split(' ')[1]
      p 'token'
      p token
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
    User.find(@current_user_id)
  end

  def access_control
    unless logged_in?
      render json: {
        status: '401',
        meessage: 'unauthorized access'
      }, status: :unauthorized
    end
  end

  def authorization_header
    request.headers.to_h['HTTP_AUTHORIZATION']
  end

  def custom_errors(errors)
    errors.full_messages.split(',')[0]
  end
end
