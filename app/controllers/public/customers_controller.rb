class Public::CustomersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @customer = Customer.find_by(id: current_customer)
  end

  def edit
    @customer = Customer.find_by(id: current_customer)
  end

  def update
    @customer = Customer.find_by(id: current_customer)
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find_by(id: current_customer.id)
    contracts = Contract.where(customer_id: current_customer.id)
    @customer.update!(is_deleted: true)
    contracts.each do |contract|
      phone_number_id = contract.phone_number_id
      phone_number = PhoneNumber.find_by(id: phone_number_id)
      contract.update(is_under_contract: false, termination_date: Time.current)
      phone_number.update!(sale_status: 2)
    end
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:company_name, :email, :post_code, :address, :telephone_number, :last_name, :first_name)
  end
  def ensure_guest_user
    # ゲストログインでユーザー編集画面へのURLが入力された場合、マイページへリダイレクト
    @customer = Customer.find_by(id: current_customer.id)
    if @customer.company_name == "guestuser"
      redirect_to my_page_path
    end
  end
end
