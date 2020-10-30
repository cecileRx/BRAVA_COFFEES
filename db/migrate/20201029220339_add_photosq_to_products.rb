class AddPhotosqToProducts < ActiveRecord::Migration[5.2]
  def change
     add_column :products, :photo_square, :string
  end
end
