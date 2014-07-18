require 'spec_helper'

describe "Orders" do
	let!(:p1) { FactoryGirl.create :product }
	before do
	  add_line_items
	  visit store_path
	end

	subject { page }

	describe "creating the order" do
		before { click_link "checkout" }
		it { should have_content "fill in the details" }

		describe "with invalid details" do
			before { click_button "Create Order" }
			it { should have_content "error" }
		end

		describe "with valid details" do
			initCartId = nil
			before do
				initCartId = Cart.last.id
				fill_in "Name",	with: "abhay"
				fill_in "Email",	with: "abhayemailid@gmail.com"
				fill_in "Address", 	with: "address iskcon nvcc"
				select	"Check",	from: "order_pay_type"
				click_button "Create Order"
			end
			it { should have_content "order is successfully placed" }
			# it { save_and_open_page }

			it "should attach line items in the order" do
				Order.last.line_items.count.should be > 0
			end

			it "should destroy the original cart" do
				expect(Cart.find_by(id: initCartId)).to eq nil
			end
		end
	end

end
