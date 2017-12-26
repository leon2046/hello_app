Rails.application.routes.draw do
  get 'top/index'

  get 'rakuten/query'
  get 'goods/query'

  get '/login', to: 'sessions#login'

  post '/login', to: 'sessions#authorize'

  get '/logout', to: 'sessions#destroy'

  delete '/logout', to: 'sessions#destroy'

  resources :goods
  resources :customers
  resources :orders
  resources :order_details
  resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
