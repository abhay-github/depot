require 'spec_helper'

describe "AuthenticationPages" do
	subject	{ page }
	let(:user) { FactoryGirl.create :user }
	before do
		visit new_session_path
	end

	describe "with invalid information" do
		before do
		  fill_in "Name", with: user.name
		  fill_in "Password", with: "wrong_password"
		  click_button 'Sign in'
		end
		it { should have_content 'username/password is incorrect' }
	end

	describe "with valid information" do
		before do
		  fill_in "Name", with: user.name
		  fill_in "Password", with: user.password
		  click_button 'Sign in'
		end
		it { should have_content 'Welcome' }
	end
end
