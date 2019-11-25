Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users
  resources :users do
    resources :jobs
  end

  get '/search' => 'jobs#search', :as => 'search_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', :to => 'about#index'
  get 'home', :to => 'home#index'
  get 'jobs', :to => 'jobs#index'
  get 'contact', :to => 'contact#index'
  get 'manage store', :to => 'users#index'
  get 'job/:id', :to => 'jobs#show', :as => 'job_detail'
  get 'billing', :to => 'billing#index'
  get 'billing/card/new' => 'billing#new_card', :as => 'add_payment_method'
  get 'billing/card/delete/:id' => 'billing#destroy', :as => 'delete_card'
  post 'billing/card' => "billing#create_card", as: :create_payment_method
  get 'billing/success' => 'billing#success', as: :success
end
