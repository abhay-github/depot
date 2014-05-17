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
		it { should have_selector "li", text: p1.name }
	end
end
