class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.item.with_tax_price
    end
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  def order_params
    params.require(:order).permit(:payment,:postage,:postal_code,:address,:name,:payment_method,:status)
  end

end
