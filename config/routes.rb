Designgirls::Application.routes.draw do
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  resources :users
  resources :tutorials
  resources :slides
  resources :sessions, only: [:new, :create, :destroy]
end