module Api
  module V1
    class WatchlistsController < ApplicationController
      before_action :access_control
      def index
        user_watchlist = current_user.watchlists.all
        render json: {
          status: '201',
          meessage: 'Data fetched',
          data: user_watchlist
        }, status: :accepted
      end

      def create
        new_item = current_user.watchlists.new(watchlist_params)
        if new_item.valid? && new_item.save
          render json: {
            status: 'ok',
            message: 'Content created',
          }, status: :created
        else
          render json: {
            status: 'Error',
            message:custom_errors(new_item.errors),
          }, status: :unprocessable_entity
        end
      end

      def update
        item = current_user.watchlists.find(params[:id])
        if item.update(article_params)
          render json: {
            status: 'ok',
            message: 'Content updated',
          }, status: :created
        else
          render json: {
            status: 'Error',
            message:custom_errors(new_item.errors),
          }, status: :unprocessable_entity
        end
    
      end

      def destroy
      end

      private

      def watchlist_params
        params.permit(:title, :link, :content, :date)
      end
    end
  end
end
