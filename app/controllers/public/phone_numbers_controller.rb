class Public::PhoneNumbersController < ApplicationController

  def index
    @phone_numbers = PhoneNumber.where(sale_status: 0)
    cart = current_customer.cart_items
    @cart_items = cart.all
    @cart_item = CartItem.new
  end

  def show

  end

  def search
    @phone_numbers = PhoneNumber.search(params[:keyword]).where(sale_status: 0)
    @word = params[:keyword]
    @cart_item = CartItem.new
    cart = current_customer.cart_items
    @cart_items = cart.all
    render :index
  end
end
