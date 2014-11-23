Designgirls::Application.routes.draw do
  resources :categories

  get "about/index"
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  resources :users
  resources :categories
  resources :tutorials
  resources :slides
  resources :sessions, only: [:new, :create, :destroy]
end