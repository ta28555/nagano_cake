class Admin::HomesController < ApplicationController

  def top
    @order = Order.page(params[:page]).per(10).order('id DESC')
  end

end
