class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      #binding.pry
    end

    @cart_items = current_customer.cart_items
    @total = 0
    @postage = 800
  end

  def create
    @order = current_customer.order.new(order_params)
    @order.status = 0
    @order.save
      redirect_to public_thanks_path
  end


  def index
  end

  def show
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment,:postage,:postal_code,:address,:name,:payment_method)
  end

end
