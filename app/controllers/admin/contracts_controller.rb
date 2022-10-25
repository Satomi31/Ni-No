class Admin::ContractsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @contracts = Contract.page(params[:page])
  end
end
