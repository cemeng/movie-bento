class AddRatingToMovie < ActiveRecord::Migration
  def self.up
      add_column :movies, :rating_id, :integer
  end

  def self.down
    remove_column :movies, :rating_id
  end
end
