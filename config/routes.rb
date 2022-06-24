# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: %i[create destroy] do
      resources :accounts, only: %i[index create destroy]
    end
  end
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # Defines the root path route ("/")
  # root "articles#index"
end
