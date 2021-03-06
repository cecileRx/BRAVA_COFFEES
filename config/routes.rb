Rails.application.routes.draw do


  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  scope '(:locale)', locale: /pt|en/ do
    root to: 'pages#home'

      resources :products, only: [:index, :show, :edit, :update]
      resources :pages, only: [:home, :new, :create, :about, :brewing]
      # get :coffee_product, controller:'products'
      get :coffee_product, to: "products#coffee_product"

      get :about, to: "pages#about"
      get :brewing, to: "pages#brewing"
      get :contact, to: 'pages#home'

      get 'carts/:id' => "carts#show", as: "cart"
      delete 'carts/:id' => "carts#destroy"

      # post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
      # post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"
      post 'order_items' => "order_items#create"
      get 'order_items/:id' => "order_items#show", as: "order_item"
      delete 'order_items/:id' => "order_items#destroy"

      resources :subscriptions do
        get :messages, to: "new_subscription_message"
      end


   # resources :order_items
    resources :orders

    resources :orders do
       resources :payments, only: :new
       get :renew, to: "renew"
       get :messages, to: "new_order_message"
       get :failure_message, to: "failure_order_message"
    end
  end

 mount StripeEvent::Engine, at: '/stripe-webhooks'

end
