class Order < ApplicationRecord

  has_many :oeder_ditails, dependent: :destroy
  belongs_to :customer
  
  def current_postage
    800
  end
  
  def destination
    # postal_code + " " + address + " " + name
    "#{postal_code} #{address} #{name}"
  end

  enum payment_method: {
    credit: 0, # クレジットカード
    bank: 1 # 銀行振込
  }

  enum status: {
    waiting: 0, # 入金待ち
    confirmed: 1, # 入金確認
    in_creation: 2, # 製作中
    preparing: 3, # 発送準備中
    delivered: 4 # 発送済
  }

end
