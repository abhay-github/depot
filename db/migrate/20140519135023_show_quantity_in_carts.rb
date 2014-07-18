class ShowQuantityInCarts < ActiveRecord::Migration
	def up
		Cart.all.each do |crt|
			hs = Hash.new(0)
			crt.line_items.each do |li|
				hs[li.product.name] += 1
				# remove line items which are duplicate
				if hs[li.product.name] > 1
					li.destroy
				end
			end

			# set the count correctly
			crt.reload
			crt.line_items.each do |li|	
				li.update(quantity: hs[li.product.name])
			end

		end
	end

	def down
		Cart.all.each do |crt|
			sz = crt.line_items.size
			crt.line_items.each do |li|
				if li.quantity > 1
					(2..(li.quantity)).each do 
						crt.line_items.create(product: li.product)
					end
					li.update(quantity: 1)
				end
			end
		end
	end
end

# crt.line_items.group(:product_id).sum(:quantity)