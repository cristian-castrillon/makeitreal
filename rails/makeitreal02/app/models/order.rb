class Order < ApplicationRecord
  # belongs_to :product
  has_many :orders_products
  has_many :products, through: :orders_products
  belongs_to :user
  has_one :invoice

  scope :with_products, -> (id) {
    includes(:products).find(id)#.products
  }

  scope :with_products_n_1, -> () {
    all.each do |order|
      order.products.each { |p| puts "PRODUCT = #{p.sku}" }
    end
  }

end
