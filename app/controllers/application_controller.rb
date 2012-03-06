class ApplicationController < ActionController::Base
  before_filter :authorize, :set_categories
  protect_from_forgery

  def set_categories 
    #session[:service_type] = %w{ public commericial }
    @categories = Category.all
  end

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart #the return keyword is not needed - cart alone is enough
    end

  protected
    def authorize
      unless User.find_by_id( session[:user_id] )
        redirect_to login_url, :notice => "Please login", :alert => "Please login"
      end
    end

    def admin_authorize
      if User.where( :id => session[:user_id], :admin => true ).count < 1
        redirect_to login_url, :notice => "Please login", :alert => "Please login"
      end
    end

end
