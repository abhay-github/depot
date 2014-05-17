require 'spec_helper'

describe LineItem do
	let!(:p1) { FactoryGirl.create :product }
	let!(:c1) { FactoryGirl.create :cart }
	let!(:li1) { FactoryGirl.create :line_item, product: p1, cart: c1 }

	subject	{ li1 }

	it { should respond_to :cart }
	it { should respond_to :product }
	it { should be_valid }

	it "should have cart_id" do
		li1.cart = nil
		expect(li1).not_to be_valid
	end

	it "should have product_id" do
		li1.product = nil
		expect(li1).not_to be_valid
	end	
end
