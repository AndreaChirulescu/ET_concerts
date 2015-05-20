Rails.application.routes.draw do  
  devise_for :users
  root 'home#index'

  resources :countries

  resources :venues

  resources :concerts

  resources :statuses
  
end
