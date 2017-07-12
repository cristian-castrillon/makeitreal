require "test_helper"

class MyOrderTest < Minitest::Test

  def test_it_should_exists_order_model
    order_1 = ::MyEcommerce::Order.new
    assert_instance_of(::MyEcommerce::Order, order_1)
  end

  def test_it_products_total_1
    order = ::MyEcommerce::Order.new
    order.products = []
    assert_equal order.total, 0
  end
  
  def test_it_products_total_2
    order = ::MyEcommerce::Order.new
    order.products = [{name: 'weed', price: 2000}]
    assert_equal order.total, 2000
  end

  def test_it_products_total_3
    order = ::MyEcommerce::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total, 9000
  end

  def test_it_products_total_with_coupon
    order = ::MyEcommerce::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    
  end
end