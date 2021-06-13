class Public::CartItemsController < ApplicationController

  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    CartItem.save
    redirect_to cart_items_path
  end

end
