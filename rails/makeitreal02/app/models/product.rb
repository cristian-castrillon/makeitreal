class Product < ApplicationRecord
  has_many :orders_products
  has_many :orders, through: :orders_products

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  scope :in_inventory, -> { where("quantity > :qty", qty: 0) }
  scope :not_expired, -> { where(expired: false) }
  scope :by_price, -> { order(:price) }

  # def not_expired_in_inventory
  #   in_inventory.not_expired
  # end
end
