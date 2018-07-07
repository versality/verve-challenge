Rails.application.routes.draw do
  resources :products
  resources :products_search, only: [:index]

  root 'products#index'
end
