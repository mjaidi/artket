Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :galleries, only: [:index, :show, :update] do
    member do
      get 'contact', to: "galleries#contact"
    end
  end
  resources :exhibitions, only: [:index, :show, :create, :update]
  resources :artists, only: [:show, :create, :update, :destroy]
  resources :art_photos, only: [:destroy]

#Subcategories Routes
  get "categories/:id/get_subcategories", to: "artworks#get_subcategories", as: :get_subcategories , defaults: { format: "js" }


# Logged In Gallerist Routes - dashboard, and lists
  get "users/:user_id/galleries/:gallery_id", to: "galleries#user_gallery", as: :user_gallery
  get "users/:user_id/gallerist_dashboard", to: "pages#user_gallery_dashboard", as: :user_gallery_dashboard
  get "users/:user_id/exhibitions/:exhibition_id", to: "exhibitions#user_exhibition", as: :user_exhibition
  get "users/:user_id/exhibitions", to: "exhibitions#user_exhibitions", as: :user_exhibitions
  get "users/:user_id/artists", to: "artists#user_artists", as: :user_artists
  patch "users/:user_id/exhibitions/:exhibition_id", to: "exhibitions#add_artwork", as: :user_exhibition_artwork
  patch "users/:user_id/exhibitions/:exhibition_id/:artwork_id", to: "exhibitions#remove_artwork", as: :user_exhibition_artwork_remove


# Logged In user Routes - Likes and Dashboard
  get "users/:user_id/dashboard", to: "pages#user_dashboard", as: :user_dashboard
  get "users/:user_id/artworks/:artwork_id", to: "artwork_likes#create", as: :create_artwork_like
  delete "users/:user_id/artworks/:artwork_id", to: "artwork_likes#destroy", as: :destroy_artwork_like
  get "users/:user_id/gallery/:gallery_id", to: "gallery_likes#create", as: :create_gallery_like
  delete "users/:user_id/gallery/:gallery_id", to: "gallery_likes#destroy", as: :destroy_gallery_like
  get "users/:user_id/artist/:artist_id", to: "artist_likes#create", as: :create_artist_like
  delete "users/:user_id/artist/:artist_id", to: "artist_likes#destroy", as: :destroy_artist_like

  # Messages Routes 
  get "users/:user_id/conversations", to: "conversations#index", as: :conversations
  post "users/:user_id/conversations", to: "conversations#create", as: :create_conversation
  post "users/:user_id/conversations/:conversation_id/messages", to: "messages#create", as: :create_conversation_message

end


