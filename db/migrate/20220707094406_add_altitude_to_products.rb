class AddAltitudeToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :altitude, :string
  end
end
