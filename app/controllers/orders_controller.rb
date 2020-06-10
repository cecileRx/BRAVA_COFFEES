class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])

    total = []
    @order.order_items.each do |item|

      total << item.product.price_cents * item.quantity.to_i
    end
    @order.amount_cents_cents = total.sum
 end

  def update
    order = Order.find(params[:id])
    order.update(order_params)


    line_items_order = order.order_items.map { |item|{
      "name" => item.product.name,
      "amount" => item.product.price_cents,
      "currency" => 'eur',
      "quantity" => item.quantity,
      "description" => item.grind
      }
    }



    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      shipping_address_collection: {
        allowed_countries: ['US', 'CA', 'FR', 'PT', 'ES']
      },

      line_items: line_items_order,

      success_url: new_order_message_url(order),
      cancel_url: order_url(order)
      # success_url: Rails.env == 'development' ? dashboard_path : "https://www.yoururbanpotager.com/confirmation",
      # cancel_url: dashboard_path
    )

  # customer = Stripe::Customer.create(
  #   :email => params[:stripeEmail],
  #   :source => params[:stripeToken]
  # )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

    order.update(state: 'paid')

  end

  private

  def order_params
    params.require(:order).permit(:amount_cents_cents)
  end

end
