class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    if @order.status == "confirmed"
      @order.order_ditails.each do |order_ditail|
        order_ditail.update(making_status: 1)
      end
    end

    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
  end



end
