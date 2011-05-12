require 'test_helper'

class MovieTest < ActiveSupport::TestCase
	fixtures :movies

	def new_movie( image )
		Movie.new( 	:title 		=> "test 123",
								:overview => "test",
								:duration	=> "160",
								:image		=> image )
	end

  test "movie attributes must not be empty" do
  	movie = Movie.new
  	assert movie.invalid?
  	assert movie.errors[:title].any?
  	assert movie.errors[:overview].any?
  	assert movie.errors[:image].any?
  end
  
  test "movie duration must be positive" do
  	movie = Movie.new( :title 		=> "Test 123",
  										 :overview 	=> "Test",
  										 :image 		=> "test.png" )
  	
  	movie.duration = -1
  	
  	assert movie.invalid?
  	assert_equal "must be greater than or equal to 0.01", movie.errors[:duration].join('; ')
  	
  	movie.duration = 0
  	assert movie.invalid?
  	assert_equal "must be greater than or equal to 0.01", movie.errors[:duration].join('; ')
  	
  	movie.duration = 10
  	assert movie.valid?, "#{movie.duration} should be valid"
  
  end
  
  test "image url" do
  	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
		
		ok.each do |name|
			assert new_movie( name ).valid?, "#{name} shouldn't be invalid" 
		end

  	bad = %w{ red.doc fred.gif/more fred.gif.more }
  	
  	bad.each do |name|
  		assert new_movie( name ).invalid?, "#{name} shouldn't be valid" 
  	end
  	
  end

	test "movie is not valid without a unique title" do
  	movie = Movie.new( :title 		=> movies(:blades).title,
  										 :overview 	=> "Test",
  										 :duration	=> 10,
  										 :image 		=> "test.png" )	
		assert movie.save == false

		assert_equal I18n.translate( 'activerecord.errors.messages.taken' ), movie.errors[:title].join('; ')
	end
	
	test "movie title must be more than 5 characters" do
  	movie = Movie.new( :title 		=> "Test",
  										 :overview 	=> "Test",
  										 :duration	=> 10,
  										 :image 		=> "test.png" )	
		
		assert movie.invalid?

	end
  
end
