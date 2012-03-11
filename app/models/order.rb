class Order < ActiveRecord::Base
	has_many :cart_items, :dependent => :destroy 
  belongs_to :user

	PAYMENT_TYPES = [ "Cheque", "Credit Cart", "Purchase Order" ]

	validates :name, :address, :email, :pay_type, :presence => true
	validates :pay_type, :inclusion => PAYMENT_TYPES

	def add_cart_items_from_cart( cart )
		cart.cart_items.each do |item|
			item.cart_id = nil
			cart_items << item
		end
	end

end
