class OrderDitail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: {
    not_possible: 0, # 製作不可
    waiting: 1, # 製作待ち
    in_creation: 2, # 製作中
    complete: 3 # 製作完了
  }

end
