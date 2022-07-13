Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get '/home', to: 'home#index'

  get '/writings', to: 'articles#index'
  resources :articles

  get '/events', to: 'events#index'
end
