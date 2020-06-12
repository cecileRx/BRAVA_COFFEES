Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  # get :coffee_product, controller:'products'
  get :coffee_product, to: "products#coffee_product"






 resources :order_items

 resources :orders, only: [:show, :update] do
    resources :payments, only: :new
    resources :messages, only: :new
 end

 mount StripeEvent::Engine, at: '/stripe-webhooks'

end
