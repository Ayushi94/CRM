Rails.application.routes.draw do
  devise_for :users
  resources :main,only: :index
  root to: 'main#index'
  resources :users do
  	get :dashboard, on: :collection
  	resources :customers
    resources :email_campaigns
  end
end