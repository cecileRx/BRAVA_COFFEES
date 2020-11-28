class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  monetize :price_cents
end
