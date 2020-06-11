Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show] do

   get 'coffees', to: 'products#coffee_product', as: :coffees
 end

 resources :order_items

 resources :orders, only: [:show, :update] do
    resources :payments, only: :new
    resources :messages, only: :new
 end

 mount StripeEvent::Engine, at: '/stripe-webhooks'

end
