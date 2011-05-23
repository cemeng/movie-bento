require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Rent order received", mail.subject
    assert_equal ["dave@pragprog.com"], mail.to
    assert_equal ["admin@railsmoviedepot.com"], mail.from
    #assert_match "Hi", mail.body.encoded    #a string that match the movie in the order is expected here
  end

end
