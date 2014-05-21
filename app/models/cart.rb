class Cart < ActiveRecord::Base
	has_many	:line_items, dependent: :destroy


  def create_line_item(product_id)
    li = self.line_items.find_by(product_id: product_id)
    if li
        li.quantity += 1
    else
        li = self.line_items.build(product_id: product_id)
    end
    li
  end

  def total_price
    # self.line_items.inject(0) { |memo, li| memo+li.total_price }
    self.line_items.to_a.sum { |li| li.total_price }
  end

end
