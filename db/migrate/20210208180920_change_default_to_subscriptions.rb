class ChangeDefaultToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:subscriptions, :active, false)
  end
end
