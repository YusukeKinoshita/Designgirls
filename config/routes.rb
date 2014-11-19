Designgirls::Application.routes.draw do
  resources :slides

  resources :tutorials

  root  'about#index'
  match '/about', to:'about#index', via:'get'
  resources :users
  resources :tutorials
  resources :slides
end