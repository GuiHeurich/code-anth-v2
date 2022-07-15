Rails.application.routes.draw do
  root "home#index"

  resources :articles
  get '/writings', to: 'articles#index'

  get '/home', to: 'home#index'
  get '/events', to: 'events#index'
  get '/readings', to: 'readings#index'
  get '/contact', to: 'contact#index'
end
