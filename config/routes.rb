Rails.application.routes.draw do
  root "home#index"
  get '/home', to: 'home#index'
  get '/writings', to: 'articles#index'
  resources :articles
  get '/events', to: 'events#index'
end
