# config/routes.rb
  Rails.application.routes.draw do
  	get '/photo/:id' => 'photo#:id'
    post 'photo/store'
    post 'photo/delete'
    root 'photo#index'
  end