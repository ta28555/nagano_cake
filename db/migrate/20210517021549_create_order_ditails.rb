class CreateOrderDitails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_ditails do |t|

      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :making_status, default:0

      t.timestamps

    end
  end
end
