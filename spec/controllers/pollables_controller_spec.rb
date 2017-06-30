require 'spec_helper'

describe Aeternitas::WebUi::PollablesController, type: :controller do
  routes { Aeternitas::WebUi::Engine.routes }

  describe "#index" do
    it 'renders the pollable overview' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'selects all pollable classes' do
      get :index
      expect(assigns(:pollable_classes)).to match_array([Website, Patent])
    end
  end

  describe "#show" do
    it 'renders pollale page' do
      get :show, params: {id: "Website"}
      expect(response).to have_http_status(:success)
    end

    it 'selects the right pollable' do
      get :show, params: {id: "Website"}
      expect(assigns(:pollable)).to be(Website)
    end
  end

  describe "timeline" do
    it 'renders the pollables timeline' do
      get :timeline, params: {id: "Website", from: 3.days.ago.to_s, to: Time.now.to_s, format: :json}
      expect(response).to have_http_status(:success)
    end
  end

  describe "execution_time" do
    it 'renders the execution time data' do
      get :execution_time, params: {id: "Website", from: 3.days.ago.to_s, to: Time.now.to_s, format: :json}
      expect(response).to have_http_status(:success)
    end
  end

  describe "data_growth" do
    it 'renders the data_growth data' do
      get :data_growth, params: {id: "Website", from: 3.days.ago.to_s, to: Time.now.to_s, format: :json}
      expect(response).to have_http_status(:success)
    end
  end

  describe "#deactivated_pollables" do
    it 'renders deactivated pollable data' do
      get :deactivated_pollables, params: {id: "Website", format: :json}
      expect(response).to have_http_status(:success)
    end

    it 'selects the right pollables' do
      get :deactivated_pollables, params: {id: "Website", format: :json}
      expect(assigns(:pollable_meta_data)).to(
        match_array(Aeternitas::PollableMetaData.where(pollable_class: 'Website').deactivated.to_a)
      )
    end
  end

  describe "#all_pollables" do
    it 'renders pollable data' do
      get :all_pollables, params: {id: "Website", format: :json}
      expect(response).to have_http_status(:success)
    end

    it 'selects the right pollables' do
      get :all_pollables, params: {id: "Website", format: :json}
      expect(assigns(:pollable_meta_data)).to(
        match_array(
          Aeternitas::PollableMetaData
            .where(pollable_class: 'Website')
            .limit(10)
            .offset(0)
            .order(last_polling: :desc)
            .to_a
        )
      )
    end
  end
end