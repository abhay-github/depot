class AdminController < ApplicationController
	before_action	:authorize
	def index
		@totalOrders = Order.count
	end
end
