Rails.application.routes.draw do
  resources :orders
  get 'ping', to: 'health_check#ping'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shops do
    resources :meals, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :meals, only: [:index, :show]
  devise_for :users, controllers: {sessions: "users/sessions"}
  root to: 'meals#index'
end
