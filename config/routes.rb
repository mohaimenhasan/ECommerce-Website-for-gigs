Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#index'
  devise_for :users
  resources :users do
    resources :jobs
    resources :wallets
  end

  get '/search' => 'jobs#search', :as => 'search_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
