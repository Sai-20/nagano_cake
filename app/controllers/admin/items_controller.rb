class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
     @item = Item.find(params[:id])
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def edit
  end
end
