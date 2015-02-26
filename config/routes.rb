Rails.application.routes.draw do
	
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :main, only: :index
  resources :users do
  	get :dashboard, on: :collection
  	resources :customers do
      get :import, on: :collection
      post :save_import, on: :collection
    end
    resources :email_campaigns
  end
  root to: 'main#index'
end