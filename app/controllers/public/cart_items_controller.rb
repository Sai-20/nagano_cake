class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.update(amount: cart_item.amount.to_i + @cart_item.amount.to_i)
      redirect_to public_cart_items_path
    else
      if @cart_item.save
        flash[:notice] = 'カートに入りました.'
        redirect_to public_cart_items_path
      else
      render 'public/items/show'
      end
    end
  end

  def update
    current_customer.cart_items.find(params[:cart_item][:item_id])
    if cart_item.update(cart_items_params)
    redirect_to public_cart_items_path
    else
      render 'public/items/show'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to public_cart_items_path
  end



  def destroy_all
    @destroy_all = current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end