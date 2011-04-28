class StoreController < ApplicationController
	def index
		@movies = Movie.all
	
		#bonus point
		if session[:counter].nil?
			session[:counter] = 0
		else
			session[:counter] = session[:counter] + 1
		end
		
		@counter = session[:counter]

  	end

end
