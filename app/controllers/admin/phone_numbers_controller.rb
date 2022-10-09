class Admin::PhoneNumbersController < ApplicationController
  def index
    @phone_number = PhoneNumber.new
    @phone_numbers = PhoneNumber.all
  end
  
  def create
    phone_number = PhoneNumber.new(phone_number_params)
    phone_number.save
    redirect_to "/admin/phone_numbers"
  end

  def show
  end

  def edit
  end
  
  private
  
  def phone_number_params
    params.require(:phone_number).permit(:telephone_number, :sale_status)
  end
  
end
