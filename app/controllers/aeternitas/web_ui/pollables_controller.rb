module Aeternitas
  module WebUi
    class PollablesController < Aeternitas::WebUi::ApplicationController
      include ActionController::ImplicitRender

      before_action :set_pollable, except: [:index]
      before_action :set_timerange, only: [:timeline, :execution_time, :data_growth]

      def index
        @pollable_classes = Aeternitas::PollableMetaData
          .distinct(:pollable_class)
          .pluck(:pollable_class)
          .map(&:constantize)
      end

      def show ; end

      def timeline ; end

      def execution_time
        @polling_time = Aeternitas::Metrics.execution_time(@pollable, from: @from, to: @to, resolution: @resolution)
      end

      def data_growth
        @pollables_created = Aeternitas::Metrics.pollables_created(@pollable, from: @from, to: @to, resolution: @resolution)
        @sources_created = Aeternitas::Metrics.sources_created(@pollable, from: @from, to: @to, resolution: @resolution)
      end

      def deactivated_pollables
        start = params.fetch(:start, 0)
        limit = params.fetch(:length, 10)

        @pollable_meta_data = Aeternitas::PollableMetaData
          .deactivated
          .includes(:pollable)
          .where(pollable_class: @pollable.name)
          .limit(limit)
          .offset(start)
          .order(deactivated_at: :desc)
      end

      def all_pollables
        start = params.fetch(:start, 0)
        limit = params.fetch(:length, 10)

        @pollable_meta_data = Aeternitas::PollableMetaData
          .where(pollable_class: @pollable.name)
          .includes(pollable: :sources)
          .limit(limit)
          .offset(start)
          .order(last_polling: :desc)
      end

      private

      def set_pollable
        pollable_name = params.fetch(:id)

        if Aeternitas::PollableMetaData.where(pollable_class: pollable_name).exists?
          @pollable = pollable_name.constantize
        else
          render_error(404, "Pollable of type #{pollable_name} not found")
          false
        end
      end
    end
  end
end