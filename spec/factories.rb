FactoryGirl.define do
	factory :product do
		sequence(:name)	{ Faker::Commerce.product_name }
		sequence(:description)	{ Faker::Lorem.sentence(3) }
		sequence(:price)		{ (rand 10..100).round(2) }
		image_url	"ROR-Logo-256.png"
	end

	factory :cart do

	end

	factory :line_item do
		product
		cart
		quantity	1
		price	10
	end

	factory :user do
		name 	"name 1"
		password	"foobar"
		password_confirmation	"foobar"
	end
end