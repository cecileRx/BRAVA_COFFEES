

class OrderMailerPreview < ActionMailer::Preview

  def new_order_email
    # Set up a temporary order for the preview
    order = Order.new(id: 250, user_id: 3)
    OrderMailer.with(order: order).new_order_email
  end

  def admin_order_email
    # Set up a temporary order for the preview
    order = Order.new(id: 250, user_id: 3, created_at: '3nov', state: 'paid', shipping_zone: 'Portugal', shipping_method: 'regular mail', shipping_cost: 320, amount_cents_cents: 440, collect_address: "Fumeiro")
    OrderMailer.with(order: order).admin_order_email
  end
 end
