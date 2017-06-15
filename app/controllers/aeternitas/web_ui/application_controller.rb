module Aeternitas
  module WebUi
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      def render_error(status, message)
        @status = status
        @message = message
        render template: 'aeternitas/web_ui/dashboard/error', status: status
      end
    end
  end
end
