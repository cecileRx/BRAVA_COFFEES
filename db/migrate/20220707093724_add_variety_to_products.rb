class AddVarietyToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :variety, :string
  end
end
