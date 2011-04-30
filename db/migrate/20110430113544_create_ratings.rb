class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.string :code
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
