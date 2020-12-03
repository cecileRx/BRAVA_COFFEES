class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :price_id
      t.integer :user_id
      t.datetime :current_period_start
      t.datetime :current_period_end
      t.string :item_choice
      t.string :grind
      t.boolean :active, default: true
      t.string :stripe_id

      t.timestamps
    end
  end
end
