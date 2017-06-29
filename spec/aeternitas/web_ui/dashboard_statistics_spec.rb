require 'spec_helper'

describe Aeternitas::WebUi::DashboardStatistics do
  describe '.enqueued' do
    it "returns the number of currently enqueued pollables" do
      create_list :website_enqueued, 10
      create :website
      expect(Aeternitas::WebUi::DashboardStatistics.enqueued).to be(10)
    end
  end

  describe '.count_polls_24h' do
    it 'returns the sum of all polls within the last 24h' do
      Timecop.freeze do
        res = double()
        expect(res).to receive(:map).and_return([10])
        expect(Aeternitas::Metrics).to(
          receive(:polls)
            .with(Aeternitas::Pollable, {from: 1.day.ago, to: Time.now, resolution: :day})
            .and_return(res)
        )

        expect(Aeternitas::WebUi::DashboardStatistics.count_polls_24h).to be(10)
      end
    end
  end

  describe '.count_failed_polls_24h' do
    it 'returns the sum of all failed polls within the last 24h' do
      Timecop.freeze do
        res = double()
        expect(res).to receive(:map).and_return([10])
        expect(Aeternitas::Metrics).to(
          receive(:failed_polls)
            .with(Aeternitas::Pollable, {from: 1.day.ago, to: Time.now, resolution: :day})
            .and_return(res)
        )

        expect(Aeternitas::WebUi::DashboardStatistics.count_failed_polls_24h).to be(10)
      end
    end
  end

  describe '.timeline' do
    it 'returns a timeline of '
  end


end