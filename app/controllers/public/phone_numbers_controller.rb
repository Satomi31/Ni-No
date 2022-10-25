class Public::PhoneNumbersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @phone_numbers = PhoneNumber.where(sale_status: 0).page(params[:page])
    cart = current_customer.cart_items
    @cart_items = cart.all
    @cart_item = CartItem.new
  end

  def search
    @phone_numbers = PhoneNumber.search(params[:keyword]).where(sale_status: 0).page(params[:page])
    @word = params[:keyword]
    @cart_item = CartItem.new
    cart = current_customer.cart_items
    @cart_items = cart.all
    render :index
  end

  def ryoban
    @phone_numbers = PhoneNumber.good_number_search().page(params[:page])
    @cart_item = CartItem.new
    cart = current_customer.cart_items
    @cart_items = cart.all
  end
end
