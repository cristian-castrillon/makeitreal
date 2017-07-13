module MyEcommerce
  module Models
    class Order
      attr_accessor :products
      # def initialize(product)
      #   @product = product
      # end

      def total(shipping_addr, coupon = nil)
        shipping = 0
        shipping = 15 if shipping_addr[:country] == 'CA' || shipping_addr[:country] == 'MX'
        shipping = 25 unless shipping_addr[:country] == 'CA' || shipping_addr[:country] == 'MX' || shipping_addr[:country] == 'US'
        
        if coupon
          raise InvalidCouponError unless coupon[:code].start_with?('C')
          raise InvalidCouponError if coupon[:discount].negative?
        end
        discount = coupon ? coupon[:discount].to_f : 0
        discount = (discount / 100)
        
        total = 0
        self.products.each { |product| total += product[:price] }
        
        total -= (total * discount)
        
        total + shipping
      end
    end
  end
end