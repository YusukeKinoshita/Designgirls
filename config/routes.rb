Designgirls::Application.routes.draw do
  resources :products

  get "about/index"
  root  'about#index'
  match '/about', to:'about#index', via:'get'

  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/mypage', to: 'categories#mypage',     via: 'get'
  devise_scope :user do
  get "sign_in", :to => "devise/sessions#new"
  delete "sign_out", :to => "devise/sessions#destroy"
end
  devise_for :users, :controllers => {
    # :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  resources :users
  # resources :tutorials
  # resources :slides
  resources :categories

  resources :tutorials do
    resources :slides
  end
  resources :sessions, only: [:new, :create, :destroy]
end