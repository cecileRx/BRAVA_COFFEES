class PaymentsController < ApplicationController
    def new
    #@order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @order = Order.find(params[:order_id])

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

      line_items: line_items_order,

      success_url: new_order_message_url(@order),
      cancel_url: order_url(@order)
      # success_url: Rails.env == 'development' ? dashboard_path : "https://www.yoururbanpotager.com/confirmation",
      # cancel_url: dashboard_path
    )


    # customer = Stripe::Customer.create(
    #   :email => params[:stripeEmail],
    #   :source => params[:stripeToken]
    # )



  end

end
