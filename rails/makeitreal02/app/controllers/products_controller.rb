class ProductsController < ApplicationController
  def index
    @products = Product.all
    #@products = Product.where("quantity > :qty", qty: 0)
    #@products = Product.in_inventory
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(products_path)
    else
      @errors = @product.errors.full_messages
      render "products/new"
    end
  end

  def product_params
    params.require(:product).permit(:sku, :quantity, :name)
  end
end