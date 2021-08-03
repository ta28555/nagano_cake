class Admin::HomesController < ApplicationController

  def top
    if params[:customer_id].present?
      @order = Order.where(customer_id: params[:customer_id]).page(params[:page]).per(10).order('id DESC')
    else
      @order = Order.all.page(params[:page]).per(10).order('id DESC')
    end
  end

end
