class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy 

  def add_movie(movie_id)
    current_item = cart_items.find_by_movie_id(movie_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(:movie_id => movie_id)
    end
    current_item
  end

  def total_items
    cart_items.count
  end
end
