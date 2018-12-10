# frozen_string_literal: true

# config/routes.rb
Rails.application.routes.draw do
  get '/photo/:id' => 'photo#show'
  post 'photo/store'
  post 'photo/delete'
  root 'photo#index'
  # resources :photo
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
end
