atom_feed do |feed|
	feed.title "Superhero Products"
	feed.updated	@products.maximum(:updated_at)

	@products.each do |product|
		feed.entry(product) do |entry|
			entry.title		product.name
			entry.content	product.description
			entry.author do |author|
				author.name	product.price
			end
		end
	end
end