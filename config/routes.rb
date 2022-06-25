# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: %i[create] do
      resources :accounts, only: %i[index create destroy] do
        resources :transactions, only: %i[index create destroy post]
        resources :payments, only: %i[index create destroy]
      end
    end
  end
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
