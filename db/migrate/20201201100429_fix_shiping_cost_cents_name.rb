class FixShipingCostCentsName < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :shiping_cost_cents, :shipping_cost_cents
  end
end
