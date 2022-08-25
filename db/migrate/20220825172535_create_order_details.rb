class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :purchase_price
      t.integer :production_status

      t.timestamps
    end
  end
end
