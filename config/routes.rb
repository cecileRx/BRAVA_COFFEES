Rails.application.routes.draw do


  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  scope '(:locale)', locale: /fr|pt/ do
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :products, only: [:index, :show, :edit, :update]
    resources :pages, only: [:home, :new, :create, :about, :brewing]
    # get :coffee_product, controller:'products'
    get :coffee_product, to: "products#coffee_product"

    get :about, to: "pages#about"
    get :brewing, to: "pages#brewing"
    get :contact, to: 'pages#home'


   resources :order_items

   resources :orders, only: [:show, :update] do
      resources :payments, only: :new
      resources :messages, only: :new
   end
end

 mount StripeEvent::Engine, at: '/stripe-webhooks'

end
