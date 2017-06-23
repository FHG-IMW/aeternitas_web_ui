module Aeternitas
  module WebUi
    class PollablesController < Aeternitas::WebUi::ApplicationController
      include ActionController::ImplicitRender

      before_action :set_pollable, except: [:index]
      before_action :set_time_range, only: [:timeline, :execution_time, :data_growth]


      def index
        respond_to do |format|
          format.html { }
          format.json { }
        end
      end

      def show ; end

      def timeline
        respond_to do |format|
          format.json { render json: Aeternitas::WebUi::PollableStatistics.timeline(@pollable, @from, @to)}
        end
      end

      def execution_time
        respond_to do |format|
          format.json { render json: Aeternitas::WebUi::PollableStatistics.execution_time(@pollable, @from, @to)}
        end
      end

      def data_growth
        respond_to do |format|
          format.json { render json: Aeternitas::WebUi::PollableStatistics.data_growth(@pollable, @from, @to)}
        end
      end

      def deactivated_pollables
        start = params.fetch(:start, 0)
        limit = params.fetch(:length, 10)

        @pollable_meta_data = Aeternitas::WebUi::PollableStatistics.deactivated_pollables(@pollable, start: start, limit: limit)
      end

      def all_pollables
        start = params.fetch(:start, 0)
        limit = params.fetch(:length, 10)

        @pollable_meta_data = Aeternitas::WebUi::PollableStatistics.all_pollables(@pollable, start: start, limit: limit)
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

      def set_time_range
        @from = DateTime.parse(params.require(:from))
        @to = DateTime.parse(params.require(:to))
      end
    end
  end
end