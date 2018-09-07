Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks, only: [:index, :show]
  resources :galleries, only: [:index, :show] do
    member do
      get 'contact', to: "galleries#contact"
    end
  end
  resources :exhibitions, only: [:index, :show]
end
