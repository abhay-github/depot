require 'spec_helper'

describe Product do
	
	let(:product) { FactoryGirl.create :product }

	subject { product }

	it { should respond_to :name }
	it { should respond_to :price }
	it { should respond_to :description }
	it { should respond_to :image_url }

	it { should be_valid }


	describe "when name is not present" do
		before { product.name = " " } 
		it { should_not be_valid }
	end
	describe "when name is too short" do
		before { product.name = "a"*5 }
		it { should_not be_valid }
	end
	describe "when description is not present" do
		before { product.name = " " } 
		it { should_not be_valid }
	end
	describe "when image_url is not present" do
		before { product.image_url = " " } 
		it { should_not be_valid }
	end
	
	describe "when price is zero" do
		before { product.price = 0 }	
		it { should_not be_valid }
	end	
	describe "when name is not unique" do
		before do
		  other_product = Product.create(name: 'a product', 
			description: 'this is some sample description text',
			price: 30.45, image_url: 'pic2.jpg')
		  product.name = other_product.name
		end
		it { should_not be_valid }
	end
	describe "when image_url is of incorrect format" do
		it "should be invalid" do
			formats = %w[name1.doc name2.gif.pdf]
			formats.each do |f|
				product.image_url = f
				expect(product).not_to be_valid
			end
		end
	end
end
