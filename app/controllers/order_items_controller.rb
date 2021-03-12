class OrderItemsController < ApplicationController



 def create
   chosen_weight = params[:weight].to_i
   chosen_product = Product.find(params[:product_id])



     if chosen_weight == 250
       @product = Product.where({name: chosen_product.name, weight: 250}).first
     elsif
       @product = Product.where({name: chosen_product.name, weight: 1000}).first

     else
      @product = chosen_product
     end

      @order_item = OrderItem.new


      if session[:cart_id] == nil
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
      end


      @order_item.cart_id = @current_cart.id
      @order_item.product = @product
      @order_item.grind = params[:grind]
      @order_item.quantity = params[:quantity]
      @order_item.shipping_points = @product.shipping_points * params[:quantity].to_i

     if @product.category.name == 'coffee'
       @order_item.weight = params[:weight].to_i
     end


     @order_item.save!


    redirect_to cart_path(current_cart)
  end


  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    @cart= @order_item.cart
    total = []
    @cart.order_items.each do |item|
      total << item.product.price_cents
    end
    @cart.amount_cents_cents = total.sum
    @current_cart.order_items.count

    redirect_to cart_path(@current_cart)
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity,:product_id, :cart_id)
  end


end
