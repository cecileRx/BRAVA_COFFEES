class AddAmountCentsCentsToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :amount_cents_cents, :integer, default: 0, null: false
  end
end
