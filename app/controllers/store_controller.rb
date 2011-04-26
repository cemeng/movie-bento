class StoreController < ApplicationController
  def index
    @movies = Movie.all
  end

end
