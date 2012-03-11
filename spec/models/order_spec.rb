require 'spec_helper'

describe Order do
  describe "add_cart_items_from_cart" do
    it "adds cart items from cart to order" do
      cart = Cart.new
      movie = Movie.new
      cart.add_movie(movie.id)
      order = Order.new

      order.cart_items.length.should == 0
      order.add_cart_items_from_cart(cart)
      order.cart_items.length.should == 1 
    end
  end
end
