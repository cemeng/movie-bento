class Order < ActiveRecord::Base
	has_many :cart_items, :dependent => :destroy 
  belongs_to :user

	PAYMENT_TYPES = [ "Cheque", "Credit Cart", "Purchase Order" ]
  
	validates :name, :address, :email, :pay_type, :presence => true
	validates :pay_type, :inclusion => PAYMENT_TYPES

  def self.for_user(user_id)
    find_all_by_user_id(user_id)
  end

	def add_cart_items_from_cart( cart )
		cart.cart_items.each do |item|
			item.cart_id = nil
			cart_items << item
		end
	end

  def movie_titles
    titles = []
    cart_items.each do |item|
      titles << item.movie.title 
    end
    titles
  end

end
