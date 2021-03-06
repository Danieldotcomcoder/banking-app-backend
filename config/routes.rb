# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
      resources :users, only: %i[create] do
        resources :accounts, only: %i[index create destroy update] do
          resources :transactions, only: %i[index create destroy]
          resources :payments, only: %i[index create destroy]
          resources :cheques, only: %i[index]
          resources :cashes, only: %i[index create]
          resources :credit_cards, only: %i[index create update]
        end
      end
    end
  end
end
