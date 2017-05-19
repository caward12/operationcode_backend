module Api
  module V1
    class RequestsController < ApplicationController

      def index
        render json: Request.unclaimed.order('created_at DESC')
      end

      def create
        @request = Request.create(request_params)
        render json: @request
      end

      private

      def request_params
        params.require(:request)
              .permit(:user_id, :details, :language,
                      :service_id, :requested_mentor_id)
      end

    end
  end
end
