class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    
  end
end
