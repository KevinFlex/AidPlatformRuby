Rails.application.routes.draw do
  namespace :api do


  get 'messages/index'
  get 'conversations/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  end
end

# $rails routes
