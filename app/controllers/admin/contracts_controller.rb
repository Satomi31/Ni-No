class Admin::ContractsController < ApplicationController

  def index
    @contracts = Contract.page(params[:page])
  end
end
