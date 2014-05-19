class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :product, :cart, presence: true
end


# class AddCountToCarts < ActiveRecord::Migration
# 	def up
# 		Cart.all.each do |crt|
# 			h = Hash.new(0)
# 			crt.line_items.each do |li|
# 				h[li.product.name] += 1
# 				# remove line items which are duplicate
# 				if h[li.product.name] > 1
# 					li.destroy
# 				end
# 			end

# 			# set the count correctly
# 			crt.line_items.each do |li|	
# 				li.update(quantity: h[li.product.name])
# 			end

# 		end
# 	end

# 	def down
# 		Cart.all.each do |crt|
# 			sz = crt.line_items.size
# 			crt.line_items.each do |li|
# 				if li.quantity > 1
# 					# write code to create so many new line items in that cart (and modify quantity of this line item ?)
# 				end
# 			end
# 		end
# 	end
# end
