# config/routes.rb
Rails.application.routes.draw do
  	get 'sessions/new'
	get '/photo/:id' => 'photo#show'
	post 'photo/store'
	post 'photo/delete'
	root 'photo#index'
	resources :users
	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'
end