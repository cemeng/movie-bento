class OrdersController < ApplicationController

  skip_before_filter :authorize, :only => [:name, :create]

  def index
    @orders = Order.for_user(session[:user_id]).paginate :page => params[:page], :order => 'created_at desc', :per_page => 10

    respond_to do |format|
      format.html
      format.xml { render :xml => @orders }
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @order }
    end
  end

  def new
  	@cart = current_cart
    @hide_checkout = true
  	
  	if @cart.cart_items.empty?
  		redirect_to store_url, :notice => 'Your cart is empty'
  		return # this is important! otherwise render error
  	end
  	
    @order = Order.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @order }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
		@order.add_cart_items_from_cart( current_cart )    
    # need to ensure that user is logged in
    @order.user_id = session[:user_id]

    respond_to do |format|
      if @order.save
      	# Cart is transient - Order is permanent
        Cart.destroy(session[:cart_id])
      	
      	# would be better if there is a manager that handles the session manager - session helper maybe?
        session[:cart_id] = nil

        Notifier.order_received(@order).deliver
        format.html { redirect_to( store_url, :notice => 'Thank you for your order. An email confirmation will be sent shortly.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
