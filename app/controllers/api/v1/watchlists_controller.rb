module Api
  module V1
    class WatchlistsController < ApplicationController
      before_action :access_control
      def index
        user_watchlist = current_user.watchlists.all
        render json: {
          meessage: 'Data fetched',
          data: user_watchlist
        }, status: :ok
      end

      def create
        new_item = current_user.watchlists.new(watchlist_params)
        if new_item.save
          render json: {
            message: 'Content created'
          }, status: :created
        else
          render json: {
            message: custom_errors(new_item.errors)
          }, status: :unprocessable_entity
        end
      end

      def update
        item = current_user.watchlists.find(params[:id])
        if item.update(watchlist_params)
          render json: {
            message: 'Content updated'
          }, status: :ok
        else
          render json: {
            message: custom_errors(new_item.errors)
          }, status: :unprocessable_entity
        end
      end

      def destroy
        item = current_user.watchlists.find(params[:id])
        if item.destroy
          render json: {
            message: 'Content deleted'
          }, status: :ok
        else
          render json: {
            status: 'Error',
            message: custom_errors(new_item.errors)
          }, status: :unprocessable_entity
        end
      end

      private

      def watchlist_params
        params.permit(:title, :link, :content, :date, :id)
      end
    end
  end
end
