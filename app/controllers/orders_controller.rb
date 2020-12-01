class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = Order.all
  end


  def create
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

    redirect_to order_path(@order)

  end

  def show
    @order = Order.find(params[:id])
    @user = current_user

    line_items_order = @order.order_items.map { |item|{
      "name" => item.product.name,
      "amount" => item.product.price_cents,
      "currency" => 'eur',
      "quantity" => item.quantity,
      "description" => item.grind
      }
    }

    testshipment = []
    @order.order_items.each do |item|
      testshipment << item.shipping_points
    end
    shipment_score = testshipment.sum

    set_shipping_cost = @order.order_items
    shipping_cost_amount = 0

    if set_shipping_cost.any? { |val| val[:weight] == 1000 }
      if shipment_score < 4
        shipping_cost_amount = 360
      else
        shipping_cost_amount = 0
      end

    else
      if shipment_score > 7
        shipping_cost_amount = 0
      elsif shipment_score > 2
        shipping_cost_amount = 360
      else
        shipping_cost_amount = 160
      end
    end

    @order.shipping_cost_cents = shipping_cost_amount


    shipping_costs = {
      name: 'shipping_costs',
      amount: @order.shipping_cost_cents,
      currency: 'eur',
      quantity: 1,
      description: 'shipping_costs'
    }

    line_items_order << shipping_costs


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

  def update

    @order = Order.find(params[:id])
    @order.shipping_method = params[:shipping_method]
    @order.shipping_zone = params[:shipping_zone]
    @order.save

    redirect_to order_path(@order)
  end




end
