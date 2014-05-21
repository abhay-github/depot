require 'spec_helper'

describe Cart do
	# let(:p1) { FactoryGirl.create :product }
	# let(:p2) { FactoryGirl.create :product }
	# let(:c1) { FactoryGirl.create :cart }
	# let(:l1) { FactoryGirl.create :line_item, product: p1, cart: c1, quantity: 2 }
	# let(:l2) { FactoryGirl.create :line_item, product: p2, cart: c1 }

	create_cart

	subject	{ c1 }

	it { should respond_to :line_items }
	it { should respond_to :total_price }

	its(:total_price) { should eq  (l1.total_price + l2.total_price) }
end
