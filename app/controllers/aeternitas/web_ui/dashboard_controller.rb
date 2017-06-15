module Aeternitas
  module WebUi
    class DashboardController < Aeternitas::WebUi::ApplicationController
      def index

      end

      def polls_24h
        @polls = Aeternitas::WebUi::DashboardStatistics.polls_24h
        respond_to do |format|
          format.json { render json: @polls }
        end
      end

      def future_polls
        @polls = Aeternitas::WebUi::DashboardStatistics.future_polls

        respond_to do |format|
          format.json { render json: @polls }
        end
      end

      def pollable_growth
        @polls = Aeternitas::WebUi::DashboardStatistics.pollable_growth
        respond_to do |format|
          format.json { render json: @polls }
        end
      end

      def error

      end
    end
  end
end
