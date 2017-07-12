module MyEcommerce
  class Order
    attr_accessor :products
    # def initialize(product)
    #   @product = product
    # end

    def total(cupon)
      if cupon[:code].start_with?('C')
        total = 0
        self.products.each { |product| total += product[:price] }
        return total - (total * cupon[:discount])
      else
        return
      end
    end
  end
end