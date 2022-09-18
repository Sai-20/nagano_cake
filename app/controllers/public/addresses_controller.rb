class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.new
  end

  def create
    @addresses = Address.new
  end

  def edit
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
end
