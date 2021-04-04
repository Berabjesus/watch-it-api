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
          user_watchlist = current_user.watchlists.all
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
