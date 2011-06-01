class ApplicationController < ActionController::Base
  before_filter :authorize
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

  protected
    def authorize
      unless User.find_by_id( session[:user_id] )
        redirect_to login_url, :notice => "Please login", :alert => "Please login"
      end
    end
end
