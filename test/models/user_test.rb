require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "New User" do
    user = User.new
    assert_response :success
  end
  
end
