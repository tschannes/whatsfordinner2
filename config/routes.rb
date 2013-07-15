Whatsfordinner::Application.routes.draw do

  resources :users do
    resources :reservations
  end

  resources :restaurants

  #resources :categories, only: [:get] Not sure if we need a Get request here....

  resource :session, only: [:new, :create, :destroy]

  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signout', to: 'sessions#destroy', via: :get

  root to: 'restaurants#index'

end
