require "test_helper"

class MyOrderTest < Minitest::Test

  def test_it_should_exists_order_model
    order_1 = MyEcommerce::Models::Order.new
    assert_instance_of(MyEcommerce::Models::Order, order_1)
  end

  def test_it_products_total_1
    order = ::MyEcommerce::Models::Order.new
    order.products = []
    assert_equal order.total({ country: 'US', addr: 'Out there' }), 0
  end
  
  def test_it_products_total_2
    order = ::MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}]
    assert_equal order.total({ country: 'US', addr: 'Out there' }), 2000
  end

  def test_it_products_total_3
    order = ::MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total({ country: 'US', addr: 'Out there' }), 9000
  end

  def test_it_products_total_with_coupon_0
    order = MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total({ country: 'US', addr: 'Out there' }, {code: 'C_random', discount: 0 }), 9000
  end

  def test_it_products_total_with_coupon_50
    order = MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total({ country: 'US', addr: 'Out there' }, {code: 'C_random', discount: 50 }), 4500
  end

  def test_it_products_total_with_coupon_100
    order = MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total({ country: 'US', addr: 'Out there' }, {code: 'C_random', discount: 100 }), 0
  end

  def test_it_coupon_start_without_c
    order = MyEcommerce::Models::Order.new
    assert_raises(MyEcommerce::InvalidCouponError) {
      order.total({ country: 'US', addr: 'Out there' }, {code: 'D_random', discount: 100 })
    }
  end

  def test_it_coupon_with_negative_discount
    order = MyEcommerce::Models::Order.new
    assert_raises(MyEcommerce::InvalidCouponError) {
      order.total({ country: 'US', addr: 'Out there' }, {code: 'D_random', discount: -100 })
    }
  end

  def test_it_with_products_coupon_address
    order = MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total({ country: 'CO', addr: 'Out there' }, { code: 'C_random', discount: 50 }), 4525
  end

  def test_it_with_products_address
    order = MyEcommerce::Models::Order.new
    order.products = [{name: 'weed', price: 2000}, {name: 'vodka', price: 4000}, {name: 'beer', price: 3000}]
    assert_equal order.total({ country: 'CA', addr: 'Out there' }), 9015
  end

  # Sin productos pero con cupon y address
  # Sin productos pero con address
end