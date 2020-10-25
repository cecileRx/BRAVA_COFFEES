class RemoveGrindOptionsToProducts < ActiveRecord::Migration[5.2]
  def change
     remove_column :products, :grind_options, :string
  end
end
