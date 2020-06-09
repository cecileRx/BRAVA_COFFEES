class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :origin
      t.string :name
      t.string :region
      t.string :process
      t.text :cupping_notes
      t.text :description
      t.references :category, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
