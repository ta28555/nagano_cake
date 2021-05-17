class Order < ApplicationRecord

  has_many :oeder_ditails, dependent: :destroy

  belongs_to :customer

end
