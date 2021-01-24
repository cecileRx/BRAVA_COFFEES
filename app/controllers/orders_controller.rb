class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index

    @user = current_user
    if @user.admin?
        orders = Order.all
        pending_orders = []
        orders.each do |item|
          if item.checkout_session_id != nil
             pending_orders << item
          end
        end

        @stripe_paid_orders = []
        pending_orders.each do |item|
          if Stripe::Checkout::Session.retrieve("#{item.checkout_session_id}").payment_status  == 'paid'

             @stripe_paid_orders << item
          end

        end

    else
      redirect_to root_url
    end
  end


  def create
    @order = Order.new

    total = []
    @current_cart.order_items.each do |item|

      total << item.product.price_cents * item.quantity.to_i
    end

    @order.amount_cents_cents = total.sum

    if @order.amount_cents_cents == 0
      redirect_to root_path
    else
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

  end

  def show
    @order = Order.find(params[:id])
    @user = current_user


end

  def update

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

    if @user.stripe_id != nil
      customer = Stripe::Customer.retrieve(@user.stripe_id)
    else
      customer = Stripe::Customer.create({
        email: current_user.email,
        name: current_user.username
      })
    end

    if @order.collect_address == nil
      @order.shipping_zone = params[:shipping_zone]
    end

    if @order.shipping_zone == nil
      @order.collect_address = params[:collect_address]
    end


    if  @order.shipping_zone == 'Rest of Europe'
      @order.shipping_method = "Registered mail"
    else
      @order.shipping_method = params[:shipping_method]
    end

    if @order.collect_address != nil && @order.shipping_method == nil

      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],

        customer: customer.id,

        line_items: line_items_order,

        success_url: order_messages_url(@order),
        cancel_url:  order_failure_message_url(@order)
      )

       @user.stripe_id = customer.id
       @user.save

       @order.checkout_session_id = @session.id
       @order.save

    else

       testshipment = []
    @order.order_items.each do |item|
      testshipment << item.shipping_points
    end
    shipment_score = testshipment.sum

    set_shipping_cost = @order.order_items
    shipping_cost_amount = 0

    if @order.shipping_zone == nil || @order.collect_address != nil
       shipping_cost_amount = 0
    else
  # calcul des shipping cost pour le Portugal
      if @order.shipping_zone == 'Portugal'
        # calcul des shipping cost pour le Portugal en regular mail
        if @order.shipping_method != 'registered mail'
          if set_shipping_cost.any? { |val| val[:weight] == 1000 }
            if shipment_score < 5
              shipping_cost_amount = 360
            else
              shipping_cost_amount = 0
            end

          else
            if shipment_score > 7
              shipping_cost_amount = 0
            elsif shipment_score > 3
              shipping_cost_amount = 450
            else
              shipping_cost_amount = 250
            end
          end
        else
          # calcul des shipping cost pour le Portugal en registered mail
          if @order.amount_cents_cents > 5000
            shipping_cost_amount = 0
          elsif shipment_score > 4
            shipping_cost_amount = 560
          else
            shipping_cost_amount = 550
          end
        end
  # calcul des shipping cost pour le reste de l'Europe
      else
         if @order.amount_cents_cents > 7000
            shipping_cost_amount = 0
          elsif shipment_score > 7
            shipping_cost_amount = 1790
          elsif shipment_score > 2
            shipping_cost_amount = 1150
          else
            shipping_cost_amount = 870
          end
       end
    end


   @order.shipping_cost_cents = shipping_cost_amount
   @order.save

      shipping_costs = {
      name: 'shipping_costs',
      amount: @order.shipping_cost_cents,
      currency: 'eur',
      quantity: 1,
      description: "#{@order.shipping_zone} - #{@order.shipping_method}"
      }

    line_items_order << shipping_costs

      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],

        customer: customer.id,

        line_items: line_items_order,
        shipping_address_collection: {
          allowed_countries: ['GB', 'BE', 'CZ', 'FR', 'DK', 'DE', 'EE', 'IE', 'HR', 'IT', 'CY', 'LV', 'LT', 'LU', 'HU', 'MT', 'NL', 'AT', 'PL', 'RO', 'SI', 'SK', 'FI', 'SE', 'IS', 'LI', 'NO', 'CH', 'PT', 'ES', 'ME', 'MK', 'AL', 'RS', 'TR', 'DZ', 'MA', 'IL']
        },

        success_url: order_messages_url(@order),
        cancel_url:  order_failure_message_url(@order)
      )

       @user.stripe_id = customer.id
       @user.save

       @order.checkout_session_id = @session.id
       @order.save

    end

    redirect_to order_path(@order)
  end

  def renew
    @order = Order.find(params[:order_id])
    @order.collect_address = nil
    @order.shipping_zone = nil
    @order.shipping_cost_cents  = 0
    @order.save
    redirect_to order_path(@order)

  end

  def messages
    @order = Order.find(params[:order_id])
    @order.state = 'stripe payment done'
    @order.save
  end

  def failure_message
     @order = Order.find(params[:order_id])
     if @order.state == 'stripe payment done'
      redirect_to root_path
     else
       @order.state = 'Payment failure'
       @order.save
   end
  end

end
