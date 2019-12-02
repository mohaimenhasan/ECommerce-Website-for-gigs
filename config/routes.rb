Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :user

  resources :users do
    resources :jobs
  end
  resources :personal_messages, only: [:new ,:create]
  resources :conversations, only: [:index, :show]
  resources :categories, only: [:index]

  get 'categories/:id/subcategories' => 'categories#show_subcategories', :as => 'subcategories'
  get '/search' => 'jobs#search', :as => 'search_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', :to => 'about#index'
  get 'home', :to => 'home#index'
  get 'jobs', :to => 'jobs#index'
  get 'contact', :to => 'contact#index'
  get 'faq', :to=> 'faq#index'
  get 'location', :to=> 'location#index'
  get 'social', :to=> 'social#index'
  get 'privacy', :to=> 'privacy#index'
  get 'terms', :to=> 'terms#index'
  get 'manage store', :to => 'users#index'
  get 'job/:id', :to => 'jobs#show', :as => 'job_detail'
  get 'billing', :to => 'billing#index'
  get 'billing/card/new' => 'billing#new_card', :as => 'add_payment_method'
  get 'billing/card/delete/:id' => 'billing#destroy', :as => 'delete_card'
  post 'billing/card' => "billing#create_card", as: :create_payment_method
  get 'billing/success' => 'billing#success', as: :success
  get 'billing/success_message' => 'billing#success_message', as: :success_message
  get 'jobs/order/:id' => "jobs#new_order", as: :new_order
  get 'user/:id/orders' => "orders#index", as: :user_orders
  delete 'user/:id/orders/:id' => "orders#destroy", as: :delete_user_order
  if Rails.env.production?
    get '404', to: 'application#page_not_found'
    get '422', to: 'application#server_error'
    get '500', to:  'application#server_error'
  end

end
