class ApplicationController < ActionController::API
  # if the token verificaion fails
  rescue_from JWT::VerificationError, with: :nil

  @secret = Rails.application.secrets.secret_key_base[0]
  @current_user_id = nil


  def encode user_id
    token = JWT.encode({
                         user_id: user_id,
                       }, @secret, 'HS256', { expiresIn: 24.hours.from_now.to_i })
    token
  end

  def decode(token) 
    JWT.decode(token, @secret)
  end
end