class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(id: current_customer)
  end

  def edit
  end
end
