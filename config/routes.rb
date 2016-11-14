Rails.application.routes.draw do
  get 'bookings/index'

  get 'bookings/show'

  get 'bookings/new'

  get 'bookings/edit'

  get 'bookings/destroy'

  get 'guides/index'

  get 'guides/show'

  get 'guides/new'

  get 'guides/edit'

  get 'guides/destroy'

  get 'profiles/show'

  get 'profiles/new'

  get 'profiles/edit'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
