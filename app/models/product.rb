class Product < ActiveRecord::Base
	has_many	:line_items
	has_many	:orders, through: :line_items
	before_destroy :check_line_items_before_destroying

	validates :name, :description, :image_url, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :name, uniqueness: true, length: { minimum: 6 }
	validates :image_url, format: { with: /\.(png|jpg|gif|jpeg)\Z/i,
							 message: "must be only png, jpg, gif, jpeg types" }

	def self.latest
	    Product.order(:updated_at).last
	end

	def check_line_items_before_destroying
		if self.line_items.any?
			errors.add	:base, "cannot delete product when carts are referencing it"
			return false
		else
			return true
		end
	end

end
