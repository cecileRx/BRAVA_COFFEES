class AddGrindOptionsToProducts < ActiveRecord::Migration[5.2]
 def change
      add_column :products, :grind_options, :string, array: true, default: []
  end
end
