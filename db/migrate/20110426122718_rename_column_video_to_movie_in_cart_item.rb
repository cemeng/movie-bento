class RenameColumnVideoToMovieInCartItem < ActiveRecord::Migration
  def self.up
	add_column :cart_items, :movie_id, :integer
	remove_column :cart_items, :video_id, :integer
  end

  def self.down
	remove_column :cart_items, :movie_id
	add_column :cart_items, :video_id, :integer
  end
end
