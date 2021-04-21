module Api
  module V1
    class UsersController < ApplicationController
      def create
        new_user = User.new(user_params)
        if new_user.save
          render json: {
            message: 'User created',
            username: new_user.username,
            token: get_token(new_user.id)
          }, status: :created
        else
          render json: {
            message: custom_errors(new_user.errors),
            data: new_user.errors
          }, status: :unprocessable_entity
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
