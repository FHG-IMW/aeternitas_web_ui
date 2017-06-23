module Aeternitas
  module WebUi
    module ApplicationHelper
      def rate_ratio(ratio)
        label_type = case ratio
                       when 0.0...0.01
                         "badge badge-success"
                       when 0.01...0.1
                         "badge badge-warning"
                       else
                         "badge badge-danger"
                     end

        content_tag :span, "#{ratio * 100}%", class: label_type
      end

      def get_identifier(pollable)
        identifier = pollable.id.to_s
        identifier +=
          if pollable.respond_to?(:name)
            ' - ' + pollable.name.to_s
          elsif pollable.respond_to? :label
            ' - ' + pollable.label.to_s
          elsif pollable.respond_to? :identifier
            ' - ' + pollable.identifier.to_s
          elsif pollable.respond_to? :url
            ' - ' + pollable.url.to_s
        end

        identifier
      end
    end
  end
end
