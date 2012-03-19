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
  
  describe "#for_user" do
    before do
      @user = User.new
      @order = Order.new(user_id: @user.id)
    end
    
    it "returns orders for a user" do
      Order.for_user(@user.id).first == @order
    end

    it "should not return order for other user" do
      user = User.new
      order = Order.new(user_id: user.id)
      Order.for_user(@user.id).length == 1
      Order.for_user(@user.id).first == @order
    end
  end

  describe "movie_titles" do
    it "lists all movie titles on an order" do
      order = Order.new
      item = CartItem.new
      item.stub(:movie) { Movie.new(title: "movie 1") }
      order.stub(:cart_items) { [item, item] }
      order.movie_titles.length.should == 2
      order.movie_titles.first.should == "movie 1"
    end
  end
end
