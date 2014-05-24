class AdjustPriceInExistingLineItems < ActiveRecord::Migration
  def up
  	LineItem.all.each do |li|
  		li.update(price: li.product.price)
  	end
  end

  def down
  	LineItem.all.each do |li|
  		li.update(price: nil)
  	end
  end
end
