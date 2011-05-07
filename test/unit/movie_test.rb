require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "movie attributes must not be empty" do
  	movie = Movie.new
  	assert movie.invalid?
  	assert movie.errors[:title].any?
  	assert movie.errors[:overview].any?
  	assert movie.errors[:image].any?
  end
end
