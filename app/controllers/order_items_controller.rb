class OrderItemsController < ApplicationController

  before_action :set_order_item, only: %I[destroy]

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

   if current_user.orders.find_by(state: 'pending')

     OrderItem.create!(product: @product, quantity: (params[:quantity]), grind: (params[:grind]), order: current_user.orders.find_by(state: 'pending'))
   else
     order = Order.create!(user: current_user, state: 'pending')
     OrderItem.create!(product: @product,  quantity: (params[:quantity]), grind: (params[:grind]), order: current_user.orders.find_by(state: 'pending'))
   end
   respond_to do |format|
     format.html { redirect_to root_path }
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
