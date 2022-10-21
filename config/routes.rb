Rails.application.routes.draw do
  resources :subscriptions
  resources :posts
  resources :newsletters
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Create routes for # Get /subscriptions/new/1
  post '/subscriptions/new/:id', to: 'subscriptions#precreated_subscription', as: 'precreated_subscription'

  # Defines the root path route ("/")
  root "home#index"
end
