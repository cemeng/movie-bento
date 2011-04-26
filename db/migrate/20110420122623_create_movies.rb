class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.integer :duration
      t.string :director
      t.string :actors
      t.text :overview
      t.boolean :available

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
