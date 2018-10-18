Rails.application.routes.draw do
  resources :meals
  resources :shops
  devise_for :users
  root to: 'meals#index'
end
