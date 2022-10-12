class Public::ContractsController < ApplicationController
  def new
    cart = current_customer.cart_items
    @cart_items = cart.all
    @contract = Contract.new
  end

  def create
    cart_items = current_customer.cart_items.all
    #cart_itemを個別に取り出してcontractに保存
    cart_items.each do |cart_item|
      contract = Contract.new
      contract.customer_id = current_customer.id
      contract.phone_number_id = cart_item.phone_number_id
      contract.save
    end
    redirect_to complete_path
    cart_items.destroy_all
  end

  def complete
  end

  def index
    @contracts = Contract.where(customer_id: current_customer)
  end
  
  def termination
  end


end
