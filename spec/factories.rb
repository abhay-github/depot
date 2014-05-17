FactoryGirl.define do
	factory :product do
		sequence(:name)	{ Faker::Commerce.product_name }
		sequence(:description)	{ Faker::Lorem.sentence(3) }
		sequence(:price)		{ (rand 10..100).round(2) }
		image_url	"image1.png"
	end

	factory :cart do

	end

	factory :line_item do
		product
		cart
	end
end