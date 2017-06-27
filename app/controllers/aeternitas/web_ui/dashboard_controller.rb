module Aeternitas
  module WebUi
    class DashboardController < Aeternitas::WebUi::ApplicationController
      before_action :set_timerange, only: [:polls_timeline, :pollable_growth]

      def index ; end

      def polls_timeline
        @polls = Aeternitas::Metrics.polls(Pollable, from: @from, to: @to, resolution: @resolution)
        @failures = Aeternitas::Metrics.failed_polls(Pollable, from: @from, to: @to, resolution: @resolution)

        respond_to do |format|
          format.json {}
        end
      end

      def future_polls
        @labels = []
        @datasets = Hash.new { |k, v| k[v] = Array.new(7, 0) }

        (Date.today..6.days.from_now.to_date).each_with_index do |day, i|
          @labels[i] = day.strftime("%b %d")
          Aeternitas::PollableMetaData
            .where(next_polling: (day.beginning_of_day..day.end_of_day))
            .group(:pollable_class)
            .count
            .each_pair { |pollable, count| @datasets[pollable][i] = count }
        end

        respond_to do |format|
          format.json { }
        end
      end

      def pollable_growth
        @pollable_classes = Aeternitas::PollableMetaData
          .distinct(:pollable_class)
          .pluck(:pollable_class)
          .map(&:constantize)

        respond_to do |format|
          format.json {}
        end
      end

      def error ; end

      private


    end
  end
end
