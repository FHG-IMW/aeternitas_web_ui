Aeternitas::WebUi::Engine.routes.draw do
  resource :dashboard, controller: :dashboard, only: [:index] do
    get 'polls_24h', on: :collection
    get 'future_polls', on: :collection
    get 'pollable_growth', on: :collection
  end

  resources :pollables, only: [:index, :show] do
    get :timeline, on: :member
    get :execution_time, on: :member
    get :data_growth, on: :member
    get :all_pollables, on: :member
    get :deactivated_pollables, on: :member
  end

  root 'dashboard#index'
end