class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_parems)
    redirect_to customers_my_page_path
  end

  def confirm
  end

  def unsubscribe
    @customer = current_customer
    @customer.update(is_active: true)
    sign_out(@customer)
    redirect_to root_path
  end

  private
  def customer_parems
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :is_active)

  end

end
