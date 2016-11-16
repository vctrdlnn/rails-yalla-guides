Rails.application.routes.draw do

  resources :guides do
    resources :bookings
  end
  resources :bookings, only: [:destroy]
  resources :reviews
  resources :profiles

  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: "registrations"
    }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
