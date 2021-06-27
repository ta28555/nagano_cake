class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def confirm
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
  end

end
