Rails.application.routes.draw do
  devise_for :users
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 
  # root "articles#index"
end
