Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'session'

  # Defines home as root path route ("/")
  root "home#index"
  
  resources :exercises, only: %i[index]
  resources :training_plans, only: %i[update]
end
