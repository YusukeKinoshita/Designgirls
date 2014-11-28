Designgirls::Application.routes.draw do
  get "about/index"
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  resources :users
  # resources :tutorials
  # resources :slides
  resources :categories do
    resources :tutorials do
      resources :slides
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
end