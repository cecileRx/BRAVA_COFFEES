class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :grind_options, :string
  end
end
