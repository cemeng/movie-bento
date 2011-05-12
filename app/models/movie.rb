class Movie < ActiveRecord::Base
  default_scope :order => 'title'

  has_many 	:cart_items
  has_many 	:movie_categories
  belongs_to:rating
  
  before_destroy :ensure_not_referenced_by_any_cart_item

  validates :title, :overview, :image, :presence => true
	validates_length_of :title, :minimum => 5
  validates :title, 		:uniqueness 		=> true
  validates :duration, 	:numericality 	=> {:greater_than_or_equal_to => 0.01}
  validates :image, 		:format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image'
  }

  private

    def ensure_not_referenced_by_any_cart_item
      if cart_items.empty?
        return true
      else
        errors.add( :base, 'Cart Item Present')
        return false
      end
    end
end
