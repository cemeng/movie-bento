class StoreController < ApplicationController

  skip_before_filter :authorize

	def index
		@movies = Movie.all
		@categories = get_categories
		@cart = current_cart
		
		#bonus point
		if session[:counter].nil?
			session[:counter] = 0
		else
			session[:counter] = session[:counter] + 1
		end
		
		@counter = session[:counter]

  	end

end
