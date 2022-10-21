Rails.application.routes.draw do
  resources :subscriptions
  resources :posts
  resources :newsletters
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # GET all the newsletters that exist /newsletters/all and path: all_newsletters_path
  get 'newsletters/all', to: 'newsletters#all_newsletters', as: 'all_newsletters'

  # Defines the root path route ("/")
  root "home#index"
end
