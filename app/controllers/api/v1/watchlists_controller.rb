module Api
  module V1
    class WatchlistsController < ApplicationController
      def index
        render json: {
          status: '201',
          meessage: 'Data fetched',
          data: ''
        }, status: :accepted
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
