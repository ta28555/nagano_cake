class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    #@order_ditail= OrderDitail.find(params[:id])
    #@order_ditail.update(order_ditail_params)

    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
  end

  def order_ditail_params
    params.require(:order_ditail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end

end
