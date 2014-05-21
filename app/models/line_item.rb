class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :product, :cart, presence: true

  def total_price
  	self.product.price * self.quantity
  end
end

