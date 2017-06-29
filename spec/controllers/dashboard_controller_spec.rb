require 'spec_helper'

describe Aeternitas::WebUi::DashboardController, type: :controller do
  routes { Aeternitas::WebUi::Engine.routes }

  describe "#index" do
    it 'renders the dashboard page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#poll_times" do
    it 'renders polling timeline' do
      get :polls_timeline, params: {from: 3.days.ago.to_s, to: Time.now.to_s, format: :json}
      expect(response).to have_http_status(:success)
    end
  end

  describe "#future_polls" do
    it 'renders future polls data' do
      get :future_polls, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "#pollable_growth" do
    it 'renders pollable growth data' do
      get :pollable_growth, params: {from: 3.days.ago.to_s, to: Time.now.to_s, format: :json}
      expect(response).to have_http_status(:success)
    end
  end
end