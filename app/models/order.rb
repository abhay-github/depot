class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAY_TYPE = %w[Check Credit\ Card Purchase\ Order]
	VALID_EMAIL_REGEX = /\A[\w.\-]+@[a-z\d-]+\.[a-z]+\z/i

	validates	:address, :email, :name, :pay_type, presence: true
	validates	:email, format: { with: VALID_EMAIL_REGEX }#, uniqueness: { case_sensitive: false }
	validates	:pay_type, inclusion: { in: PAY_TYPE }

	before_save	{ email.downcase! }

	def fill_in_line_items(cart)
		cart.line_items.each do |li|
			li.cart_id = nil
			line_items << li
		end
	end

end
