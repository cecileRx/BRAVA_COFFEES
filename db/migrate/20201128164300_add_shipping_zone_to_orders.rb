class AddShippingZoneToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_zone, :string
  end
end
