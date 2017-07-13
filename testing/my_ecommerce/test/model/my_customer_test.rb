require "test_helper"

class MyCustomerTest < Minitest::Test
  def test_it_should_exists_customer_model
    pepe = MyEcommerce::Models::Customer.new('pepe', 'cc@mm.com')
    assert_instance_of(::MyEcommerce::Models::Customer, pepe)
  end  

  def test_it_should_not_find_customer
    assert_nil MyEcommerce::Models::Customer.find('aa@cc.com')
  end

  # def test_it_should_find_customer
    
  # end
end