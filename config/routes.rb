Rails.application.routes.draw do
  root "home#index"

  resources :articles

  get '/home', to: 'home#index'
  get '/writings', to: 'articles#index'
  get '/events', to: 'events#index'
  get '/readings', to: 'readings#index'
end
