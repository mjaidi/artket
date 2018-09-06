Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks, only: [:index, :show, :create]
  resources :galleries, only: [:index, :show]
  resources :exhibitions, only: [:index, :show]
  
  get "users/:user_id/galleries/:gallery_id", to: "galleries#user_gallery", as: :user_gallery
end
