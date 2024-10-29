class CartsController < ApplicationController
  def show
    @cartitems = Cartitem.where(cart_id: current_cart.id)
  end
end
