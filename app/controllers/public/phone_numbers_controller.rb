class Public::PhoneNumbersController < ApplicationController

  def index
    @phone_numbers = PhoneNumber.where(sale_status: 0)
    @cart_item = CartItem.new
  end

  def show

  end

  def search
    @phone_numbers = PhoneNumber.search(params[:keyword]).where(sale_status: 0)
    @word = params[:keyword]
    @cart_item = CartItem.new
    render :index
  end
end
