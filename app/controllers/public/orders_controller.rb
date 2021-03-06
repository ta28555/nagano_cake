class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def confirm
    @cart_items = current_customer.cart_items

    if params[:order][:address_kind] == "0"
      # ご自身の住所(current_customerの住所)
      @order = Order.new(
        postal_code: current_customer.postal_code,
        address: current_customer.address,
        payment_method: params[:order][:payment_method],
        name: current_customer.name
      )

      # @order = Order.new
      # @order.postal_code = current_customer.postal_code
      # ...
      # ...
    elsif params[:order][:address_kind] == "1"
      # 登録済住所
      address = Address.find(params[:order][:address_id])
      @order = Order.new(
        postal_code: address.postal_code,
        address: address.address,
        payment_method: params[:order][:payment_method],
        name: address.name
      )
    elsif params[:order][:address_kind] == "2"
      # 新お届け先
      @order = Order.new(order_params)
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_ditail = OrderDitail.new
        @order_ditail.item_id = cart_item.item.id
        @order_ditail.order_id = @order.id
        @order_ditail.price = cart_item.tax_price
        @order_ditail.amount = cart_item.amount
        @order_ditail.save
      end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    #@orders = Order.where(customer_id: current_customer.id)
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
  end

end
