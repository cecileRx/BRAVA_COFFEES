class AddGrindToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :grind, :string
  end
end
