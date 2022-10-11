class Public::PhoneNumbersController < ApplicationController

  def index
    @phone_numbers = PhoneNumber.where(sale_status: 'no_contract')
    @cart_item = CartItem.new
  end

  def show

  end
end
