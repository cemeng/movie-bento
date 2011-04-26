class AddImageToVideos < ActiveRecord::Migration
  def self.up
    add_column :movies, :image, :string
  end

  def self.down
    remove_column :movies, :image
  end
end
