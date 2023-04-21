# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'session'

  # Defines home as root path route ("/")
  root 'home#index'

  resources :exercises, only: %i[index create edit new]
  resources :training_plans, only: %i[update]
end
