Rails.application.routes.draw do
  resources :residents
  get 'resident/new'
  get 'resident/index'
  get 'resident/create'
  get 'resident/show'

  get 'house_hold/index'

  resources :groceries

  post 'v1/quantity',     to: 'groceries#quantity'
  post 'v1/purchased_at', to: 'groceries#update_purchased_at'

  root 'groceries#index'
end

