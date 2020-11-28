class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new

    total = []
    @current_cart.order_items.each do |item|

      total << item.product.price_cents * item.quantity.to_i
    end

    @order.amount_cents_cents = total.sum



    @current_cart.order_items.each do |item|
      @order.order_items << item
      item.cart_id = nil
    end

    @user = current_user
    @order.user_id = @user.id
    @order.save


    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil

    line_items_order = @order.order_items.map { |item|{
      "name" => item.product.name,
      "amount" => item.product.price_cents,
      "currency" => 'eur',
      "quantity" => item.quantity,
      "description" => item.grind
      }
    }


    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],

      shipping_address_collection: {
        allowed_countries: ['US', 'CA', 'FR', 'PT', 'ES']
      },
      customer_email: current_user.email,

      line_items: line_items_order,

      success_url: new_order_message_url(@order),
      cancel_url: order_url(@order)
    )

    customer = Stripe::Customer.create({
      email: current_user.email,
      name: current_user.username,
      metadata: {

      },
    })
       @user.stripe_id = customer.id
       @user.save
       @order.checkout_session_id = @session.id
       @order.save

  end


end
