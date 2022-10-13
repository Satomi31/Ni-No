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
      phone_number = PhoneNumber.find(cart_item.phone_number_id)
      contract.save
      phone_number.update!(sale_status: 1)
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
    @contract = Contract.find(params[:id])
  end

  def update
    contract = Contract.find(params[:id])
    phone_number_id = contract.phone_number_id
    phone_number = PhoneNumber.find_by(id: phone_number_id)
    termination_date = Time.current
    contract.update!(is_under_contract: false, termination_date: termination_date)
    phone_number.update!(sale_status: 2)
    redirect_to contracts_path
  end


end
