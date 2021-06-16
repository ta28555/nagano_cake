class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def tax_price
    (self.item.price * 1.10 ).round
  end

  def subtotal
    amount * tax_price
  end

end
