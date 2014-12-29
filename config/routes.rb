Designgirls::Application.routes.draw do
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
  resources :users do
    member do
      get :favorite, :like, :complete
    end
  end
  resources :products do
    member do
      get :favorite
    end
  end

  resources :categories

  get 'lessons/:id(/:slide_order)', to: 'tutorials#show', defaults: {slide_order: 1}, as: 'tutorial_video'
  get 'lessons/:id/change/:slide_order', to: 'slides#change', as: 'slides_change'

  get 'userlessons/:id(/:userslide_order)', to: 'usertutorials#show', defaults: {userslide_order: 1}, as: 'usertutorial_video'
  get 'userlessons/:id/change/:userslide_order', to: 'userslides#change', as: 'userslides_change'

  resources :tutorials do
    resources :slides
    member do
      get :like, :question
      post :answer
    end
  end

  resources :usertutorials do
    resources :userslides
    member do
      get :like
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :tags, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :completes, only: [:create, :destroy]
  resources :finishes, only: [:create, :destroy]
end