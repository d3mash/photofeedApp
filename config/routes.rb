# config/routes.rb
Rails.application.routes.draw do
  	get '/photo/:id' => 'photo#show'
    post 'photo/store'
    post 'photo/delete'
    root 'photo#index'
  end