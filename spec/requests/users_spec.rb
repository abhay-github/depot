require 'spec_helper'

describe "Users" do
	let!(:user) { FactoryGirl.create :user }
	subject	{ page }

	describe "creating a new user" do
		before do
		  visit new_user_path
		  fill_in "Name", with: "abhay ag"
		  fill_in "Password", with: "foobar"
		  fill_in "Confirmation", with: "foobar"
		  click_button "Create"
		end
		it { should have_content "All Users" }
	end
end
