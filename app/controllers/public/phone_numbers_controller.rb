class Public::PhoneNumbersController < ApplicationController

  def index
    @phone_numbers = PhoneNumber.where(sale_status: 0)
    @cart_item = CartItem.new
  end

  def show

  end
end
