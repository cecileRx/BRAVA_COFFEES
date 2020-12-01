class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  monetize :amount_cents_cents
  monetize :shipping_cost_cents
end
