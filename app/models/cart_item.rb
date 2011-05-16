class CartItem < ActiveRecord::Base
  belongs_to :movie
  belongs_to :cart
  belongs_to :order
  
end
