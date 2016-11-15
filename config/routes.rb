Rails.application.routes.draw do

  resources :guides do
    resources :bookings
  end
  resources :bookings, only: [:destroy]

  resources :profiles

  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
