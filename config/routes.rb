Rails.application.routes.draw do

  get 'stylists/sessions'

  root 'tops#index'

  get '/tops', to: 'tops#index' 
  resources :users
  resources :stylists
  resources :owners
  resources :shares do
    resources :comments
  end
  
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :stylist_sessions, only: [:new, :create, :destroy]
  resources :owner_sessions, only: [:new, :create, :destroy]
  
  resources :stylist_favorites, only: [:create, :destroy]
  resources :owner_favorites, only: [:create, :destroy]
  resources :agreement, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
