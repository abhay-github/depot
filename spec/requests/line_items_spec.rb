require 'spec_helper'

describe "LineItems" do
	let!(:p1) { FactoryGirl.create :product } 

	before do
		visit store_path
	end

	subject	{ page }

	describe "adding line item to cart" do
		before { click_button "add to cart" }
		it { should have_selector "div.alert", text: "added" }
		it { should have_content p1.name }
		it "should not change the line items' count" do
			# expect { click_button "add to cart" }.to change(LineItem, :count).by(1)
		end

		# perhaps the following test should be seperated out to a seperate block
		it "should show correct quantity for line items" do
			3.times do
				visit store_path
				find("li", text: p1.name).find_button("add to cart").click
			end
			expect(page).to have_content "4 × #{p1.name}"
		end

		describe "followed by deleting line item" do
			before do
				visit cart_path(Cart.first)
				click_button "remove item"  
			end
			it { should have_content "line item removed from the cart" }
			it { should_not have_content p1.name }
		end
	end

end
