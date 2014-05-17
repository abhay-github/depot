class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :product, :cart, presence: true
end
