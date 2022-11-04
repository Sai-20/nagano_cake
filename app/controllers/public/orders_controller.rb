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
    @order = current_customer.orders.new(order_params)
    @order.status = 0
    @order.save
      redirect_to public_thanks_path@cart_items = current_customer.cart_items
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.item_id = cart_item.item_id
    @order_detail.amount = cart_item.amount
    @order_detail.order_id = @order.id
    @order_detail.save
    end
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = current_customer.orders
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.item.with_tax_price
    end
    @postage = 800
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment,:postage,:postal_code,:address,:name,:payment_method)
  end

end
