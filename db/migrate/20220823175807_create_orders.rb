class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :status
      t.integer :payment
      t.integer :postage
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment_method
      
      t.timestamps
    end
  end
end
