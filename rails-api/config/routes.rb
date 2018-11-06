Rails.application.routes.draw do
  resources :orders
  get 'ping', to: 'health_check#ping'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shops do
    resources :meals, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :meals, only: [:index, :show]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  root to: 'meals#index'
end
