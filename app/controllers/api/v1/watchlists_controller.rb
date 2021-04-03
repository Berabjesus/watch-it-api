module Api
  module V1
    class WatchlistsController < ApplicationController
      def index
        if !logged_in?
          render json: {
            status: '403',
            meessage: 'unauthorized access',
          }, status: :unauthorized
        else
          user_watchlist = Watchlist.find_by_user_id(@current_user_id)
          render json: {
            status: '201',
            meessage: 'Data fetched',
            data: user_watchlist
          }, status: :accepted
        end
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
