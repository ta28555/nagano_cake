class Admin::OrderDetailsController < ApplicationController

  def update
    @order_ditail = OrderDitail.find(params[:id])
    @order_ditail.update(order_ditail_params)
    redirect_to admin_order_path(@order_ditail.order)
  end


  private

  def order_ditail_params
    params.require(:order_ditail).permit(:making_status)
  end

end
