atom_feed do |feed|
	feed.title "Who bought #{@product.name}"
	feed.updated @latest_order.try(:updated_at)

	@product.orders.each do |order|
		feed.entry(order) do |entry|
			entry.title	"Order #{order.id}"
			entry.summary type: "xhtml" do |xhtml|
				xhtml.p "Shipped to #{order.address}"
				xhtml.table do
					xhtml.tr do
						xhtml.th 'Product'
						xhtml.th 'Quantity'
						xhtml.th 'Total Price'
					end
					xhtml.tr do
						order.line_items.each do |li|
							xhtml.td li.product.name
							xhtml.td li.quantity
							xhtml.td number_to_currency(li.total_price)
						end
					end
					xhtml.tr do
						xhtml.th "Total:", colspan: 2
						xhtml.th number_to_currency(order.line_items.sum(&:total_price))
					end
				end
				xhtml.p "Paid by #{order.pay_type}"
			end
			# entry.summary "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
			entry.author do |author|
				author.name		order.name
				author.email	order.email
			end
		end
	end

end