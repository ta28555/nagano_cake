class Admin::OrderDetailsController < ApplicationController

  def update
    @order_ditail = OrderDitail.find(params[:id])
    @order_ditail.update(order_ditail_params)
    order_ditails = @order_ditail.order.order_ditails

    if order_ditails.where(making_status: "complete").count == order_ditails.count
      @order_ditail.order.update(status: 3)
    elsif order_ditails.where(making_status: "in_creation").count >= 1
      @order_ditail.order.update(status: 2)
    end

    redirect_to admin_order_path(@order_ditail.order)
  end


  private

  def order_ditail_params
    params.require(:order_ditail).permit(:making_status)
  end

end
