class ProductController < ApplicationController
	def index
    @products = [
      {name: "Weed"},
      {name: "Beer"}
    ]
    render json: @products
  end
end