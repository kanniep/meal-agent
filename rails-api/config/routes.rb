Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :meals
  resources :shops
  devise_for :users
  root to: 'meals#index'
end
