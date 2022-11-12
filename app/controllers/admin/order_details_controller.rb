class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_params)
    redirect_to admin_order_details_path
  end

end
