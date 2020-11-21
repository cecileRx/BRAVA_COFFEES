class Changeusertobeoptionalfororders < ActiveRecord::Migration[5.2]
  def change
     change_column :orders, :user_id, :integer, null: true
  end
end
