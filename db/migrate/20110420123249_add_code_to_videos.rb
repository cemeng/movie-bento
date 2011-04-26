class AddCodeToVideos < ActiveRecord::Migration
  def self.up
    add_column :movies, :code, :string
  end

  def self.down
    remove_column :movies, :code
  end
end
