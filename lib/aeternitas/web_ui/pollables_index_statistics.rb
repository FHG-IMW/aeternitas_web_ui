module Aeternitas
  module WebUi
    module PollablesIndexStatistics
      def self.available_pollables
        Aeternitas::PollableMetaData.distinct(:pollable_class).pluck(:pollable_class).map(&:constantize)
      end

      def self.failure_ratio(pollable)
        Aeternitas::Metrics.failure_ratio(
            pollable,
            from: 24.hours.ago,
            to: Time.now,
            resolution: :hour
        ).avg.round(2)
      end

      def self.guard_locked_ratio(pollable)
        Aeternitas::Metrics.guard_locked_ratio(
            pollable,
            from: 24.hours.ago,
            to: Time.now,
            resolution: :hour
        ).avg.round(2)
      end

      def self.polls(pollable)
        Aeternitas::Metrics.polls(
            pollable,
            from: 24.hours.ago,
            to: Time.now,
            resolution: :hour
        ).map { |v| v[:count] }.sum
      end
    end
  end
end