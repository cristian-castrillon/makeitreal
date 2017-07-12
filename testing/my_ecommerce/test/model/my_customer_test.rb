require "test_helper"

class MyCustomerTest < Minitest::Test
  def test_it_should_exists_customer_model
    pepe = ::MyEcommerce::Customer.new
    assert_instance_of(::MyEcommerce::Customer, pepe)
  end  

  def test_it_should_not_find_customer
    assert_nil ::MyEcommerce::Customer.find('aa@cc.com')
  end

  # def test_it_should_find_customer
    
  # end
end