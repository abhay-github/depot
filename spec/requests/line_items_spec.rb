require 'spec_helper'

describe "LineItems" do
	let!(:p1) { FactoryGirl.create :product } 

	before do
		visit store_path
	end

	subject	{ page }

	describe "adding line item to cart" do
		before { click_button "add to cart" }
		
		# following test not required bcoz of ajax
		# it { should have_selector "div.alert", text: "added" }

		it "should show added item", js: true do
			expect(page).to have_selector "div.cart", text: p1.name
		end

		# perhaps the following test should be seperated out to a seperate block
		it "should show correct quantity for line items", js:true do
			visit store_path
			3.times do
				find("li", text: p1.name).find_button("add to cart").click
			end
			expect(page).to have_content "4 × #{p1.name}"
		end

		describe "followed by deleting line item", js: true do
			before do
				visit store_path
				# click_button "remove"  
				first("input[type=submit][value=remove]").click
				page.driver.browser.switch_to.alert.accept
			end
			# it { should have_content "line item removed from the cart" }
			it { should_not have_selector "div.cart", text: p1.name }

			it "should hide cart if empty" do
				# dont know how to test this jquery fadeout css display: none
			end
		end
	end

end
