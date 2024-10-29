class CartitemsController < ApplicationController
  def new
    @cartitem = Cartitem.new
  end
  
  def create
    @cartitem = Cartitem.new(
      product_id: params[:cartitem][:product_id],
      cart_id: current_cart.id,
      qty: params[:cartitem][:qty])
    if @cartitem.save
      flash[:notice] = 'カートに追加しました'
      redirect_to root_path
    else
      flash.now[:alert] = 'エラーがあります'
      render new_cartitem_path, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cartitem = Cartitem.find(params[:id])
    if @cartitem.destroy
      flash[:notice] = 'カートから削除しました'
      redirect_to cart_path(current_cart.id)
    else
      render cart_path(current_cart.id), status: :unprocessable_entity
    end
  end
end
