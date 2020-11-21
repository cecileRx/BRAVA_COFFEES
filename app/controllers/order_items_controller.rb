class OrderItemsController < ApplicationController

  before_action :set_order_item, only: %I[destroy]
  before_action :current_order



 def create
   sel_weight = params[:weight].to_i
   sel_product = Product.find(params[:product_id])

     if sel_weight == 250
       @product = Product.where({name: sel_product.name, weight: 250}).first
     elsif
       @product = Product.where({name: sel_product.name, weight: 1000}).first
     else
      @product = sel_product
     end



    OrderItem.create!(product: @product, quantity: (params[:quantity]), grind: (params[:grind]), order: @order)


   respond_to do |format|
     # le redirect_back ets géré par la méthide store_action dans l'application controller
     format.html { redirect_back fallback_location: root_path,  notice: "Added to cart, thanks!"}
     format.js
   end
 end

  def destroy
    @order_item.destroy
    @order = @order_item.order
    total = []
    @order.order_items.each do |item|
      total << item.product.price_cents
    end
    @order.amount_cents_cents = total.sum
    @current_order.order_items.count

    respond_to do |format|
      format.html { redirect_to order_path(order)}
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
end
