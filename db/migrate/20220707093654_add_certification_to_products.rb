class AddCertificationToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :certification, :string
  end
end
