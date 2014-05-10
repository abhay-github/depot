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
			price = rand (10.00)..(100.00)
			price = price.round(2)
			Product.create!(name: name, description: description, price: price, image_url: image_url)
		end
	end

end