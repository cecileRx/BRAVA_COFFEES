class ChangeStripeIdNameToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    rename_column :subscriptions, :stripe_id, :checkout_session_id
  end
end
