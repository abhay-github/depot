namespace :db do

	desc "populating database with sample data"
	task :populate => :environment do
		require 'faker'
		img_urls = %w[Ruby_logo.png ROR-Folder-256-v1.png ROR-Folder-256-v2.png ROR-Folder-256-v3.png ROR-Logo-256.png]
		img_urls.shuffle!
		5.times do |i|
			name = Faker::Commerce.product_name
			description = Faker::Lorem.paragraph
			image_url = img_urls[i]
			# price = rand (10.00)..(100.00)
			price = rand 10..100
			price = price.round(2)
			Product.create!(name: name, description: description, price: price, image_url: image_url)
		end
	end

	desc "poulating with better data"
	task :repopulate => :environment do
		require 'faker'
		product_names = ["Acer Iconia Tablet",  "PC game: GrandTheftAuto", "Baby Gear",  "D-Link Data Card", "Philips Go Gear Mp3 Player",  "Apple Ipod-Shuffle",  "Panache Aviator Sunglasses",  "Fault In Our Stars - best selling book", "Digiflip - backpack"]
		img_urls = %w[acer-iconia.jpeg grand-theft-auto.jpeg baby-carrier.jpeg d-link.jpeg philips-gogear.jpeg apple-shuffle.jpeg panache.jpeg fault-our-stars.jpeg digiflip.jpeg]
		img_urls.count.times do |i|
			name = product_names[i]
			image_url = img_urls[i]
			description = Faker::Lorem.paragraph
			price = rand 1..100
			price = price.round(2)
			Product.create!(name: name, description: description, price: price, image_url: image_url)
		end
	end

end