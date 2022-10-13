class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(id: current_customer)
  end

  def edit
    @customer = Customer.find_by(id: current_customer)
  end
  
  def update
    customer = Customer.find_by(id: current_customer)
    customer.update(customer_params)
    redirect_to my_page_path
  end
  
  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.find_by(id: current_customer.id)
    @customer.update(is_deleted: true)
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:company_name, :email, :post_code, :address, :telephone_number, :last_name, :first_name)
  end
end
