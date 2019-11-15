Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'jobs#index'
  devise_for :users
  resources :users do
    resources :jobs
    resources :wallets
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
