module MyEcommerce
  class Customer
    attr_accessor :email

    # def initialize(email)
    #   @email = email
    # end

    Customers = [
      Customer.new.email = 'cc@mm.com',
      Customer.new.email = 'pop@mm.com',
      Customer.new.email = 'll@mm.com',
      Customer.new.email = 'nn@mm.com'
    ]


    def self.find(email)
      Customers.each do |customer|
        return customer if customer == email
      end
      return
    end
  end
end