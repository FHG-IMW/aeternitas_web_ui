module Aeternitas
  module WebUi
    module PollablesIndexStatistics
      def self.available_pollables
        Aeternitas::PollableMetaData.distinct(:pollable_class).pluck(:pollable_class).map(&:constantize)
      end

      def self.failures(pollable)
        Aeternitas::Metrics
          .failed_polls(pollable, from: 2.weeks.ago, to: Time.now, resolution: :day)
          .map {|v| v[:count]}
          .join(",")
      end

      def self.guard_locks(pollable)
        Aeternitas::Metrics
          .guard_locked(pollable, from: 2.weeks.ago, to: Time.now, resolution: :day)
          .map {|v| v[:count]}
          .join(",")
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