require 'spec_helper'

describe User do
	before	{ @user = User.new(name: "abhay ag", password: "foobar", 
		password_confirmation: "foobar") }

	subject	{ @user }

	it { should respond_to :name }
	it { should respond_to :password_digest }
	it { should respond_to :password }
	it { should respond_to :password_confirmation }

	describe "when name is not unique (case insensitive)" do
		before do
			new_usr = User.create(name: @user.name.upcase, password: "foobar", password_confirmation: "foobar")
			# raise @user.name
		end
		it { should_not be_valid }
	end

	describe "when password is not present" do
		before do
		  @user = User.new(name: "abhay ag", password: "", 
		password_confirmation: "")
		end
		it { should_not be_valid }
	end

	describe "when password doesnt match confirmation" do
		before do
		  @user = User.new(name: "abhay ag", password: "haha", 
		password_confirmation: "hoho")
		end
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before do
		  @user.save!
		end
		  let(:found_user) { User.find_by(name: @user.name) }
		it "should return user when password is correct" do
			expect(@user).to eq found_user.authenticate(@user.password)
		end
		it "should be false when password is incorrect" do
			expect(found_user.authenticate("wrongpassword")).to eq false
		end
	end
end
