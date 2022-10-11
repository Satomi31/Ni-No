class Public::CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

  def index
    cart = current_customer.cart_items
    @cart_items = cart.all
  end

  def destroy
    cart_item = CartItem.find_by(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :phone_number_id)
  end

end
