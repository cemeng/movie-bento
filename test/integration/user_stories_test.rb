require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  #fixtures :all #specifying which fixtures you want to load - let's load movies only
  fixtures :movies

  # Replace this with your real tests.
  test "user checkout scenario" do
    CartItem.delete_all
    Order.delete_all
    blades_movie = movies(:blades)

    # User goes to store index page
    get "/"
    assert_response :success
    assert_template "index"

    # Select a movie and adding it to the cart
    xml_http_request :post, '/cart_items', :movie_id => blades_movie.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.cart_items.size
    assert_equal blades_movie, cart.cart_items[0].movie

    # User check out
    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders",
                      :order => { :name     => "Felix Tjandrawibawa",
                                  :address  => "234 Elm Street",
                                  :email    => "felix@test.com",
                                  :pay_type => "Cheque"
                                }

    # Check cart is emptied
    assert_response :success
    assert_template "index"
    cart = Cart.find( session[:cart_id] )
    assert_equal 0, cart.cart_items.size

    # Check database
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal order.name,      "Felix Tjandrawibawa"
    assert_equal order.address,   "234 Elm Street"
    assert_equal order.email,     "felix@test.com"
    assert_equal order.pay_type,  "Cheque"

    assert_equal 1, order.cart_items.size
    assert_equal blades_movie, order.cart_items[0].movie

    # Check email
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["felix@test.com"], mail.to
    # test mail from
    assert_equal "Rent order received", mail.subject

  end
end
