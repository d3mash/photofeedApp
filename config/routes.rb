# config/routes.rb
  Rails.application.routes.draw do
    post 'photo/store'
    post 'photo/delete'
    root 'photo#index'
  end