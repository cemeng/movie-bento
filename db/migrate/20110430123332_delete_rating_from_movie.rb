class DeleteRatingFromMovie < ActiveRecord::Migration
	def self.up
    remove_column :movies, :rating
  end

  def self.down
    add_column :movies, :rating, :integer
  end
end
