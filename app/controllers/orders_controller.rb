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
    redirect_to new_order_payment_path(order)


  end

  private

  def order_params
    params.require(:order).permit(:amount_cents_cents)
  end

end
