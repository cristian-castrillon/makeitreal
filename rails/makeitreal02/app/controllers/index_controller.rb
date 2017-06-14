class IndexController < ApplicationController
  def search
    @user = User
      .includes(:orders)
      .includes(orders: :products)
      .find_by(email: params[:email])
    render :index
  end

  def root
    render "holi"
  end
end