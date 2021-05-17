class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :oeder_ditails, dependent: :destroy

  belongs_to :genre

end
