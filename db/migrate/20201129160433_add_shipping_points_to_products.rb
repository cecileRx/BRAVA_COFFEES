class AddShippingPointsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shipping_points, :integer
  end
end
