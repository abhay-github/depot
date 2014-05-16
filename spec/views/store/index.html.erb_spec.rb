require 'spec_helper'

describe "store/index.html.erb" do
	before do
		FactoryGirl.create(:product)
		visit store_path

	end
	subject	{ page }

	it "should show price in proper format" do
		expect(page.text).to match /\$\d+\.\d{2}/
		# save_and_open_page
	end
end
