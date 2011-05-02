class ApplicationController < ActionController::Base
  protect_from_forgery


  def get_categories
    #session[:service_type] = %w{ public commericial }
    @categories = Category.all
  end

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart #me being explicit here - cart doang is enough
    end

end
