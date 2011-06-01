class OrdersController < ApplicationController

  skip_before_filter :authorize, :only => [:name, :create]

  # GET /orders
  # GET /orders.xml
  def index
    #@orders = Order.all
    @orders = Order.paginate :page => params[:page], :order => 'created_at desc', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
  	@cart = current_cart

    @hide_checkout = true
  	
  	if @cart.cart_items.empty?
  		redirect_to store_url, :notice => 'Your cart is empty'
  		return # this is important! otherwise render error
  	end
  	
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
		@order.add_cart_items_from_cart( current_cart )    

		# how does Rails handle error? save might return error?
    respond_to do |format|
      if @order.save

      	# We want to destroy the cart and persist it to order instead
      	# Cart is transient - Order is permanent
      	Cart.destroy( session[:cart_id ]) 
      	
      	# would be better if there is a manager that handles the session manager - session helper maybe?
      	session[ :cart_id ] = nil

        # Send Email
        Notifier.order_received(@order).deliver
      
        format.html { redirect_to( store_url, :notice => 'Thank you for your order. An email confirmation will be sent shortly.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
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

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
