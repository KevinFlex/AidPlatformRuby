require "test_helper"

class RequestTest < ActiveSupport::TestCase
  test "verify requests index for Portal" do
    
    get "/api/requests"
    assert_response :success
  end

  test "post request" do
  post "/api/requests"

  assert_response :success
  end
end
