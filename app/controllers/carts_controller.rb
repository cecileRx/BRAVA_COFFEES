class CartsController < ApplicationController

  def show
    @cart = @current_cart
    total = []
    @cart.order_items.each do |item|

      total << item.product.price_cents * item.quantity.to_i
    end

    @cart.amount_cents_cents = total.sum

  end

  # def update
  #   order = Order.find(params[:id])
  #   order.update(order_params)
  #   redirect_to new_order_payment_path(order)
  # end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
