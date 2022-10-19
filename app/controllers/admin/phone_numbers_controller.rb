class Admin::PhoneNumbersController < ApplicationController
  def index
    @phone_number = PhoneNumber.new
    @phone_numbers = PhoneNumber.all
  end

  def import
    PhoneNumber.import(params[:file])
    redirect_to admin_phone_numbers_path
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    if @phone_number.save
      redirect_to admin_phone_numbers_path
    else
      @phone_numbers = PhoneNumber.all
      render :index
    end
  end

  def show
    @phone_number = PhoneNumber.find(params[:id])
    @contracts = Contract.where(phone_number_id: @phone_number.id)
  end

  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end

  def update
    phone_number = PhoneNumber.find(params[:id])
    phone_number.update(phone_number_params)
    redirect_to admin_phone_number_path(phone_number)
  end

  private

  def phone_number_params
    params.require(:phone_number).permit(:telephone_number, :sale_status)
  end

end
