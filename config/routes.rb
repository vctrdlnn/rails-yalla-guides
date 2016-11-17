Rails.application.routes.draw do

  resources :guides do
    resources :steps
    resources :bookings do
      member do
        get 'payment'
        patch 'payment', to: 'bookings#process_payment'
        patch 'confirm', to: 'bookings#confirm'
        patch 'reject', to: 'bookings#reject'
        patch 'guide_cancel', to: 'bookings#guide_cancel'
      end
    end
  end
  resources :bookings, only: [:destroy]
  resources :reviews
  resources :profiles do
    member do
      get 'guide'
    end

  end

  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: "registrations"
    }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
