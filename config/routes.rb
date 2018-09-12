Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users 
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :galleries, only: [:index, :show, :update] do
    member do
      get 'contact', to: "galleries#contact"
    end
  end
  resources :exhibitions, only: [:index, :show, :create, :update]
  resources :artists, only: [:create, :update, :destroy]
  resources :art_photos, only: [:destroy]

  get "users/:user_id/galleries/:gallery_id", to: "galleries#user_gallery", as: :user_gallery
  get "users/:user_id/gallerist_dashboard", to: "pages#user_gallery_dashboard", as: :user_gallery_dashboard
  get "users/:user_id/exhibitions/:exhibition_id", to: "exhibitions#user_exhibition", as: :user_exhibition
  get "users/:user_id/exhibitions", to: "exhibitions#user_exhibitions", as: :user_exhibitions
  get "users/:user_id/artists", to: "artists#user_artists", as: :user_artists
  patch "users/:user_id/exhibitions/:exhibition_id", to: "exhibitions#add_artwork", as: :user_exhibition_artwork
  patch "users/:user_id/exhibitions/:exhibition_id/:artwork_id", to: "exhibitions#remove_artwork", as: :user_exhibition_artwork_remove

  get "users/:user_id/dashboard", to: "pages#user_dashboard", as: :user_dashboard
  get "users/:user_id/artworks/:artwork_id", to: "artwork_likes#create", as: :create_artwork_like
  delete "users/:user_id/artworks/:artwork_id", to: "artwork_likes#destroy", as: :destroy_artwork_like
end


