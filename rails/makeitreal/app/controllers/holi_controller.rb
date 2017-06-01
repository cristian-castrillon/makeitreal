class HoliController < ApplicationController
  def crear
    redirect_to holi_actualizar_path
    # redirect_to yepeto_path(name: "cristian")
  end

  def actualizar
    # redirect_to products_url
    redirect_to products_path
  end

  def ver
    @name = params[:name]
    @products = ["Weed", "Beer", "Vodka"]
    render layout: "custom_products"
  end

  def products
    @products = [
      {name: "telefono"},
      {name: "audifono"}
    ]
    # render json: @products
  end
end
