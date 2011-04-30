class CreateMovieCategories < ActiveRecord::Migration
  def self.up
    create_table :movie_categories do |t|
      t.integer :movie_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movie_categories
  end
end
