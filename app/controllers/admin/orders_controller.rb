class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
    @order_details.each do |order_detail|
      @total = @total + order_detail.item.with_tax_price
    end
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == 'payment_confirmation'
       @order.order_details.each do |order_detail|
        order_detail.update(production_status:  'waiting_for_production')

       end

    end
    redirect_to admin_order_path
  end


  def order_params
    params.require(:order).permit(:payment,:postage,:postal_code,:address,:name,:payment_method,:status)
  end

end
