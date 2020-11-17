Rails.application.routes.draw do
  devise_for :airlines
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :planes do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :index, :edit, :update]
end
