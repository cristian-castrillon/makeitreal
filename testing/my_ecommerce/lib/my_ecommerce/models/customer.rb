module MyEcommerce
  module Models
    class Customer
      attr_accessor :email, :name

      def initialize(name, email)
        @name = name
        @email = email
      end

      # Customers = [
      #   Customer.new.email = 'cc@mm.com',
      #   Customer.new.email = 'pop@mm.com',
      #   Customer.new.email = 'll@mm.com',
      #   Customer.new.email = 'nn@mm.com'
      # ]

      Customers = [
        Customer.new('pepe', 'cc@mm.com'),
        Customer.new('popo', 'pop@mm.com'),
        Customer.new('lala', 'll@mm.com'),
        Customer.new('nana', 'nn@mm.com')
      ]


      def self.find(email)
        Customers.each do |customer|
          # return customer if customer == email
          return customer if customer.email == email
        end
        return
      end
    end
  end
end