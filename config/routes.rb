# frozen_string_literal: true

# config/routes.rb
Rails.application.routes.draw do
  resources :photos
  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :relationships, only: [:create, :destroy]

  root 'photos#index'
end
