def create_cart
	let(:p1) { FactoryGirl.create :product }
	let(:p2) { FactoryGirl.create :product }
	let(:c1) { FactoryGirl.create :cart }
	let(:l1) { FactoryGirl.create :line_item, product: p1, cart: c1, quantity: 2 }
	let(:l2) { FactoryGirl.create :line_item, product: p2, cart: c1 }
end

def add_line_items
	visit store_path
	first("input[type=submit][value='add to cart']").click
end

# def login_as
	
# end

# def logout
# 	session.delete :user_id
# end

# def setup
# 	login_as() if defined? session
# end