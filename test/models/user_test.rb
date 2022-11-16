require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without id s file" do
    user = User.new
    assert_not user.save
  end
  
end
