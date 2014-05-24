require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "Name",
      :email => "Email",
      :address => "MyText",
      :pay_type => "Pay Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/Pay Type/)
  end
end
