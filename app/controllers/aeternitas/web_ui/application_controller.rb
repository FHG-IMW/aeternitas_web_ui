module Aeternitas
  module WebUi
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      def render_error(status, message)
        @status = status
        @message = message
        render template: 'aeternitas/web_ui/dashboard/error', status: status
      end

      def set_timerange
        @from = DateTime.parse(params.require(:from))
        @to = DateTime.parse(params.require(:to))
        @resolution = get_resolution(@from, @to)
      end

      def get_resolution(from, to)
        case (to.to_time - from.to_time)
          when 0.hours..2.hours
            :minute
          when 2.hours..12.hours
            :ten_minutes
          when 12.hours..3.days
            :hour
          else
            :day
        end
      end
    end
  end
end
