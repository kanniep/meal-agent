Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :meals
  resources :shops
  devise_for :users, controllers: {sessions: "users/sessions"}
  root to: 'meals#index'
end
