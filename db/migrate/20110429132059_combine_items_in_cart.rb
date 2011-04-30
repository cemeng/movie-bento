class CombineItemsInCart < ActiveRecord::Migration
  def self.up
	
		Cart.all.each do |cart|
			sums = cart.cart_items.group(:movie_id).sum(:quantity)
			
			sums.each do | movie_id, quantity |
				if ( quantity > 1 )
					
					cart.cart_items.where( :movie_id => movie_id ).delete_all
					
					cart.cart_items.create( :movie_id => movie_id, :quantity => quantity ) 
				
				end
			end
		end
  	
  	
  
  end

  def self.down
  	CartItem.where( "quantity > 1" ).each do |cart_item|
  		
  		#split every item
  		cart_item.quantity.times do
  		
  			CartItem.create( :cart_id => cart_item.cart_id, :movie_id => cart_item.movie_id, :quantity => 1 ) 
  		
  		end
  		
  		CartItem.destroy( cart_item.id ) #am not sure whether this will work
  		#cart_item.destroy
  	
  	end
  end
end
