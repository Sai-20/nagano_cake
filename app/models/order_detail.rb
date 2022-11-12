class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    purchase_price * amount
  end

  enum production_status: { cannot_start: 0, waiting_for_production: 1, under_construction: 2,　production_completed: 3 }
end
