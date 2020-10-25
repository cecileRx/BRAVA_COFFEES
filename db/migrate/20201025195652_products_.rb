class Products < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:products, :grind_options, nil)
  end
end
