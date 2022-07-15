Rails.application.routes.draw do
  resources :users
  root "home#index"

  resources :articles
  get '/writings', to: 'articles#index'

  resources :users, only: [:create, :show]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  get '/home', to: 'home#index'
  get '/events', to: 'events#index'
  get '/readings', to: 'readings#index'
  get '/contact', to: 'contact#index'
end
