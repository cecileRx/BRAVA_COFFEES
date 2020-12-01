class AddShippingCostCentsToOrders < ActiveRecord::Migration[5.2]
  def change
     add_column :orders, :shiping_cost_cents, :integer, default: 0, null: false
  end
end
