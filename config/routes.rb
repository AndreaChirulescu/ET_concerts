Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :countries

  resources :venues

  resources :concerts

  post "update_photo_1/:id", to: "concerts#update_photo_1", as: "update_photo_1"

  resources :statuses

end
