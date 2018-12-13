# frozen_string_literal: true

# config/routes.rb
Rails.application.routes.draw do
  resources :photos
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  root 'photos#index'
end
