class Public::OrdersController < ApplicationController

  def new
    @orders = current_customer.orders
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

end
