class Movie < ActiveRecord::Base
  default_scope :order => 'title'

  validates :title, :overview, :image, :presence => true
  validates :title, :uniqueness => true
  validates :image, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image'
  }
end
