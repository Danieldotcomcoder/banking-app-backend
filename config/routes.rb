# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :sessions, only: %i[create destroy]
    resources :accounts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
