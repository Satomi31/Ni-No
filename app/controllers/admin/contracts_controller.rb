class Admin::ContractsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contracts = Contract.page(params[:page])
  end
end
