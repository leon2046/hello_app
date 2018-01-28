Rails.application.routes.draw do
  get 'top/index'

  get 'rakuten/query'
  get 'goods/query'

  get '/login', to: 'sessions#login'

  post '/login', to: 'sessions#authorize'

  get '/logout', to: 'sessions#destroy'

  delete '/logout', to: 'sessions#destroy'

  constraints(id: /[0-9]+/) do
    resources :goods do
      collection do
        post :search
      end
    end
  end

  resources :customers, constraints: { id: /[0-9]+/ }

  constraints(id: /[0-9]+/) do
    resources :orders do
      collection do
        post :search
      end
    end
  end

  constraints(id: /[0-9]+/) do
    resources :order_details do
      collection do
        post  :search
      end
    end
  end

  constraints(id: /[0-9]+/) do
    resources :payments do
      collection do
        post  :search
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
