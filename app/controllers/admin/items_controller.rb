class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  def show
  end

  def edit
  end

  def update
  end

end
