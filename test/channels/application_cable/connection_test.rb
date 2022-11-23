require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with cookies" do
    cookies.signed[:user_id] = 11
  
    connect
  
    assert_equal connection.user_id, "11"
  end
end
