class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  validates :product, presence: true
  # validates :cart, presence: true
  # validates	:cart, numericality: { allow_nil: true }
  # validates	:order, numericality: { allow_nil: true }

  def total_price
  	self.product.price * self.quantity
  end

end

