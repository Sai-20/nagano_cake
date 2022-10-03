class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    redirect_to
  end

  def update
    redirect_to
  end

  def destroy
    redirect_to
  end

  def destroy_all
    redirect_to
  end

  private

  def cart_items_prams
    params.require(:cart_items).permit(:item_id, :amount)
  end

end