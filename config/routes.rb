Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :countries

  resources :venues

  resources :concerts

  post "update_photo_1/:id", to: "concerts#update_photo_1", as: "update_photo_1"
  post "update_photo_2/:id", to: "concerts#update_photo_2", as: "update_photo_2"
  post "update_text_1/:id", to: "concerts#update_text_1", as: "update_text_1"
  post "update_text_2/:id", to: "concerts#update_text_2", as: "update_text_2"
  post "update_interview/:id", to: "concerts#update_interview", as: "update_interview"

  resources :statuses

end
