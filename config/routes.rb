Designgirls::Application.routes.draw do
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  resources :users
end