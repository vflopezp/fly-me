Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :airplanes do
    resources :bookings, only: :create
    resources :ratings, only: :create
  end
  resources :bookings, only: [:index, :destroy, :edit, :update]
end
