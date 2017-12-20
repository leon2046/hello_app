Rails.application.routes.draw do
  get 'rakuten/query'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  delete '/logout', to: 'sessions#destroy'

  resources :goods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
