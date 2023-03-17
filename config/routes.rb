Rails.application.routes.draw do
  devise_for :users
  resources :service_types
  resources :parcels
  resources :addresses
  resources :users
  # get '/users', to: 'users#index'
  # get '/users/new_user', to: 'users#new_user',as: 'new_user'
  # post '/users', to: 'users#/create_vicky',as: 'create'
  root to: 'parcels#index'
  get '/search', to: 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
