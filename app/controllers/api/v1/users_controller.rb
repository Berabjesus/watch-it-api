module Api
  module V1
    class UsersController < ApplicationController
      def create
        new_user = User.new(user_params)
        if new_user.valid? && new_user.save
          render json: {
            status: 'ok',
            message: 'User created',
            username: new_user.username,
            token: get_token(new_user.id)
          }, status: :created
        else
          render json: {
            status: 'Error',
            message: custom_errors(new_user.errors),
            data: new_user.errors
          }, status: :unprocessable_entity
        end
      end

      def login
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
        params.permit(:username, :password, :password_confirmation)
      end
    end
  end
end
