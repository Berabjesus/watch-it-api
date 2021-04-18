module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(username: user_params[:username])
        if user&.authenticate(user_params[:password])
          render json: {
            status: '202',
            message: 'login success',
            username: user.username,
            token: get_token(user.id)
          }, status: :accepted
        else
          render json: {
            status: 'Error',
            message: 'Invalid user name or password'
          }, status: :unauthorized
        end
      end

      private

      def get_token(id)
        encode(id)
      end

      def user_params
        params.permit(:username, :password)
      end
    end
  end
end
